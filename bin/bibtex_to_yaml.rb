#!/usr/bin/env ruby

require 'bibtex'
require 'yaml'
require 'optparse'

options = {
  input: 'publications.bib',
  output: '_data/publist.yml',
  overwrite: false
}

OptionParser.new do |opts|
  opts.banner = "Usage: bibtex_to_yaml.rb [options]"

  opts.on("-i", "--input FILE", "Input BibTeX file (default: publications.bib)") do |v|
    options[:input] = v
  end
  
  opts.on("-o", "--output FILE", "Output YAML file (default: _data/publist.yml)") do |v|
    options[:output] = v
  end
  
  opts.on("-f", "--force", "Force overwrite of output file") do |v|
    options[:overwrite] = true
  end
  
  opts.on("-h", "--help", "Show this help message") do
    puts opts
    exit
  end
end.parse!

# Check if the input file exists
unless File.exist?(options[:input])
  puts "Error: Input file '#{options[:input]}' does not exist."
  exit 1
end

# Check if the output file exists and we're not forcing overwrite
if File.exist?(options[:output]) && !options[:overwrite]
  puts "Error: Output file '#{options[:output]}' already exists. Use -f to force overwrite."
  exit 1
end

# Create the output directory if it doesn't exist
output_dir = File.dirname(options[:output])
unless File.directory?(output_dir)
  require 'fileutils'
  FileUtils.mkdir_p(output_dir)
end

# Helper function to clean LaTeX commands
def clean_latex(text)
  return "" if text.nil?
  
  # Remove LaTeX commands and special characters
  text = text.to_s.gsub(/\{\\['"]\}\s*\\?([A-Za-z])/, '\1') # Handle accents
  text = text.gsub(/\{|\}/, '') # Remove braces
  text = text.gsub(/\\&/, '&') # Handle ampersands
  text = text.gsub(/\\"([aeiouAEIOU])/, '\1') # Handle umlauts
  text = text.gsub(/\\([a-zA-Z]+)(\{[^\}]*\}|\s+)/, '\2') # Handle other commands
  
  # Clean HTML entities and other problematic characters
  text = text.gsub(/&amp;lt;/, '<') # Fix double-encoded HTML entities
  text = text.gsub(/&amp;gt;/, '>')
  text = text.gsub(/&lt;/, '<')
  text = text.gsub(/&gt;/, '>')
  text
end

# Helper function to format author names
def format_authors(author_text)
  return "" if author_text.nil?
  
  # Split authors by 'and'
  authors = author_text.to_s.split(/\s+and\s+/)
  
  # Format each author
  formatted_authors = authors.map do |author|
    parts = author.split(',')
    if parts.length > 1
      parts.join(', ').strip # Already in Last, First format
    else
      # Handle First Last format
      name_parts = author.split
      if name_parts.length > 1
        last_name = name_parts.pop
        "#{last_name}, #{name_parts.join(' ')}"
      else
        author.strip
      end
    end
  end
  
  formatted_authors.join(", ")
end

def extract_media_links(note_text)
  return [] if note_text.nil?

  raw = note_text.to_s
  urls = raw.scan(%r{https?://[^\s\}\],]+}).map { |u| u.gsub(/[\.,;:]+$/, '') }.uniq
  return [] if urls.empty?

  label = raw.dup
  label = label.gsub(/\\url\{[^\}]+\}/, '')
  label = label.gsub(%r{https?://[^\s\}\],]+}, '')
  label = clean_latex(label).strip
  label = label.gsub(/\s+/, ' ')
  label = label.gsub(/[\s,;:.-]+$/, '')
  label = nil if label.empty?

  urls.each_with_index.map do |url, index|
    text = if label
      urls.length > 1 ? "#{label} #{index + 1}" : label
    else
      urls.length > 1 ? "Media Coverage #{index + 1}" : "Media Coverage"
    end

    { 'text' => text, 'url' => url }
  end
end

# Parse the BibTeX file
begin
  bibliography = BibTeX.open(options[:input])
  
  # Clean HTML entities in abstractnote fields
  bibliography.each do |entry|
    if entry.has_field?('abstractnote')
      clean_abstract = entry.abstractnote.to_s
                           .gsub(/&amp;lt;/, '<')
                           .gsub(/&amp;gt;/, '>')
                           .gsub(/&lt;/, '<')
                           .gsub(/&gt;/, '>')
                           .gsub(/&amp;/, '&')
      entry.abstractnote = clean_abstract
    end
  end
  
  # Convert BibTeX entries to data
  publications = []
  
  bibliography.each do |entry|
    next unless entry.has_field?('title')
    
    pub = {
      'title' => clean_latex(entry.title.to_s),
      'authors' => clean_latex(format_authors(entry.author)),
      'year' => entry.year ? entry.year.to_s : '',
      'key' => entry.key.to_s
    }
    
    # Add month if available
    if entry.has_field?('month')
      pub['month'] = clean_latex(entry.month.to_s)
    end
    
    # Add journal info
    journal = ""
    if entry.has_field?('journal')
      journal = clean_latex(entry.journal.to_s)
    elsif entry.has_field?('booktitle')
      journal = clean_latex(entry.booktitle.to_s)
    end
    
    # Add volume, number, pages
    if entry.has_field?('volume')
      journal += ", #{entry.volume}"
    end
    if entry.has_field?('number')
      journal += "(#{entry.number})"
    end
    if entry.has_field?('pages')
      journal += ", pp #{entry.pages}"
    end
    
    pub['journal'] = journal
    
    # Add DOI/URL
    pub['doi'] = entry.doi.to_s if entry.has_field?('doi')
    pub['url'] = entry.url.to_s if entry.has_field?('url')

    note_value = nil
    if entry.has_field?('notes')
      note_value = entry.notes.to_s
    elsif entry.has_field?('note')
      note_value = entry.note.to_s
    end

    media_links = extract_media_links(note_value)
    unless media_links.empty?
      pub['press_release'] = media_links
      pub['media'] = media_links.first['url']
    end
    
    # Add BibTeX - clean HTML entities in the entry
    bibtex_str = entry.to_s
    bibtex_str = bibtex_str.gsub(/&amp;lt;/, '<')
                           .gsub(/&amp;gt;/, '>')
                           .gsub(/&lt;/, '<')
                           .gsub(/&gt;/, '>')
                           .gsub(/&amp;/, '&')
    pub['bibtex'] = bibtex_str
    
    # Add tags
    if entry.has_field?('keywords')
      pub['tags'] = entry.keywords.to_s.split(',').map(&:strip)
    elsif entry.has_field?('research_areas')
      pub['tags'] = entry.research_areas.to_s.split(',').map(&:strip)
    else
      pub['tags'] = []
    end
    
    publications << pub
  end
  
  # Sort publications by year and month
  publications.sort_by! do |pub|
    year = pub['year'].to_i
    
    month_value = 0
    if pub['month']
      month_str = pub['month'].downcase
      months = {
        'jan' => 1, 'january' => 1,
        'feb' => 2, 'february' => 2,
        'mar' => 3, 'march' => 3,
        'apr' => 4, 'april' => 4,
        'may' => 5,
        'jun' => 6, 'june' => 6,
        'jul' => 7, 'july' => 7,
        'aug' => 8, 'august' => 8,
        'sep' => 9, 'september' => 9,
        'oct' => 10, 'october' => 10,
        'nov' => 11, 'november' => 11,
        'dec' => 12, 'december' => 12
      }
      
      months.each do |name, value|
        if month_str.include?(name)
          month_value = value
          break
        end
      end
      
      if month_value == 0
        month_value = month_str.to_i if month_str.to_i > 0
      end
    end
    
    # Negative for descending order (newest first)
    [-year, -month_value]
  end
  
  # Write the YAML file
  File.open(options[:output], 'w') do |file|
    file.write(publications.to_yaml)
  end
  
  puts "Successfully converted #{publications.size} BibTeX entries to YAML."
  puts "Output written to #{options[:output]}"
rescue => e
  puts "Error processing BibTeX: #{e.message}"
  puts e.backtrace.join("\n")
  exit 1
end
