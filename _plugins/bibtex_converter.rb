require 'bibtex'
require 'citeproc'
require 'csl/styles'
require 'jekyll'

module Jekyll
  class BibTexConverter < Generator
    safe true
    priority :high

    def generate(site)
      # Configure the path to your BibTeX file
      bibtex_path = File.join(site.source, 'publications.bib')
      return unless File.exist?(bibtex_path)

      # Parse the BibTeX file
      bibliography = BibTeX.open(bibtex_path, :filter => :latex)
      
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
      
      # Sort entries by year and month (descending)
      all_entries = bibliography.data.select { |e| e.is_a?(BibTeX::Entry) }
      entries = all_entries.sort_by do |e|
        # Primary sort by year (descending)
        year = e.year ? e.year.to_i : 0
        
        # Secondary sort by month (descending)
        month_value = 0
        if e.has_field?('month')
          month_str = e.month.to_s.downcase
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
          
          # Try to match month name
          months.each do |name, value|
            if month_str.include?(name)
              month_value = value
              break
            end
          end
          
          # If no match found, try to parse as a number
          if month_value == 0
            month_value = month_str.to_i if month_str.to_i > 0
          end
        end
        
        # Return a sortable array [year, month]
        # Negative values for descending order
        [-year, -month_value]
      end
      
      # Convert BibTeX entries to site data
      publications = []
      
      entries.each do |entry|
        # Skip entries with no title
        next unless entry.title
        
        # Clean up LaTeX commands in title
        title = clean_latex(entry.title.to_s)
        
        # Create a publication entry
        pub = {
          'title' => title,
          'authors' => clean_latex(format_authors(entry.author)),
          'year' => entry.year.to_s,
          'key' => entry.key.to_s
        }
        
        # Add month information if available
        if entry.has_field?('month')
          pub['month'] = clean_latex(entry.month.to_s)
        end
        
        # Add journal/booktitle/publisher info
        pub['journal'] = if entry.has_field?('journal')
                          "#{clean_latex(entry.journal.to_s)}"
                        elsif entry.has_field?('booktitle')
                          "#{clean_latex(entry.booktitle.to_s)}"
                        else
                          ""
                        end
        
        # Add volume, number, pages if they exist
        if entry.has_field?('volume')
          pub['journal'] += ", #{entry.volume}"
        end
        
        if entry.has_field?('number')
          pub['journal'] += "(#{entry.number})"
        end
        
        if entry.has_field?('pages')
          pub['journal'] += ", pp #{entry.pages}"
        end
        
        # Add DOI if available
        pub['doi'] = entry.doi.to_s if entry.has_field?('doi')
        
        # Add URL if available
        pub['url'] = entry.url.to_s if entry.has_field?('url')
        
        # Add BibTeX reference for citation - clean HTML entities in the entry
        bibtex_str = entry.to_s
        bibtex_str = bibtex_str.gsub(/&amp;lt;/, '<')
                              .gsub(/&amp;gt;/, '>')
                              .gsub(/&lt;/, '<')
                              .gsub(/&gt;/, '>')
                              .gsub(/&amp;/, '&')
        pub['bibtex'] = bibtex_str
        
        # Extract research areas from keywords or a custom field
        if entry.has_field?('keywords')
          pub['tags'] = entry.keywords.to_s.split(',').map(&:strip)
        elsif entry.has_field?('research_areas')
          pub['tags'] = entry.research_areas.to_s.split(',').map(&:strip)
        else
          pub['tags'] = []
        end

        # Auto-tag by matching title and abstract against research area keywords
        if pub['tags'].empty?
          pub['tags'] = auto_tag(entry)
        end
        
        # Add the entry to our publications list
        publications << pub
      end
      
      # Add the publications to the site data
      site.data['publist'] = publications

      # Auto-generate latest publication entries for the sidebar
      # Takes the 5 most recent papers with a DOI and year
      latest_pubs = publications.select { |p| p['doi'] && !p['doi'].empty? && p['year'].to_i > 0 }
                                .first(5)
                                .map do |p|
        month = p['month'] || ''
        date_str = month.empty? ? p['year'] : "#{month.capitalize}, #{p['year']}"
        {
          'date' => date_str,
          'headline' => "New paper: #{p['title'].length > 80 ? p['title'][0..77] + '...' : p['title']}",
          'type' => 'publication',
          'link' => p['doi'] ? "https://doi.org/#{p['doi']}" : p['url']
        }
      end
      site.data['latest_pubs'] = latest_pubs
    end
    
    private

    # Auto-tag a BibTeX entry by matching title + abstract against keyword lists
    # for each research area. Returns an array of matching area keys.
    def auto_tag(entry)
      parts = [entry.title.to_s]
      parts << entry.abstract.to_s if entry.has_field?('abstract')
      parts << entry.abstractnote.to_s if entry.has_field?('abstractnote')
      text = parts.join(' ').downcase

      area_keywords = {
        'environment' => [
          'groundwater', 'hydro', 'soil', 'moisture', 'ambient noise seismol', 'dvv', 'dv/v',
          'seismic velocity change', 'water table', 'drought', 'flood', 'critical zone',
          'hydrodynamic', 'hydromechanical', 'agroseismology', 'farming', 'tillage',
          'evapotranspiration', 'soil stiffness', 'environmental', 'mount st. helens',
          'mount rainier', 'volcano', 'coda', 'rain', 'precipitation'
        ],
        'earthquakes' => [
          'earthquake', 'rupture', 'megathrust', 'fault slip', 'seismic source',
          'backprojection', 'source time function', 'tremor', 'slow slip',
          'ground motion', 'basin amplification', 'site amplification',
          'shaking', 'virtual earthquake', 'strong motion',
          'seismic anisotropy', 'sedimentary basin', 'parkfield', 'alpine fault',
          'subduction', 'seismic hazard', 'gorkha', 'illapel', 'thrust',
          'seismic radiation', 'protothrust', 'hydraulic fractur',
          'hydrofracture', 'ice shelf', 'rift', 'fracture', 'crack'
        ],
        'offshore' => [
          'offshore', 'submarine', 'ocean bottom', 'obs', 'seafloor',
          'das offshore', 'underwater cable', 'fiber optic',
          'ocean observator', 'cascadia seafloor', 'muxdas',
          'multiplexed distributed acoustic sensing offshore',
          'deepsub', 'ocean coupling'
        ],
        'geoscience-ai' => [
          'machine learning', 'deep learning', 'neural network',
          'convolutional', 'cnn', 'random forest', 'ensemble learning',
          'phase pick', 'earthquake detect', 'classification',
          'discriminat', 'auto-encoder', 'autoencoder', 'denois',
          'cloud comput', 'object storage', 'seisbench',
          'ai-ready', 'wavefield reconstruction', 'edge computing',
          'common task framework'
        ]
      }

      tags = []
      area_keywords.each do |area, keywords|
        if keywords.any? { |kw| text.include?(kw) }
          tags << area
        end
      end
      tags
    end
    
    def clean_latex(text)
      return "" if text.nil?
      
      # Remove LaTeX commands and special characters
      text = text.to_s
      text = text.gsub(/\{\\['"]\}\s*\\?([A-Za-z])/, '\1') # Handle accents
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
    
    def format_authors(author_text)
      return "" unless author_text
      
      # Split authors by 'and'
      authors = author_text.to_s.split(/\s+and\s+/)
      
      # Format each author: Last, First
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
  end
end
