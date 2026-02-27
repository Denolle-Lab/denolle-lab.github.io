---
title: "Denolle Lab - Publications"
layout: gridlay
excerpt: "Denolle Lab -- Publications."
sitemap: false
permalink: /publications/
---


# Publications
---

## Standards & Rubrics

As members of the scientific community, we strive to meet best practices in research communication and reproducibility. The following resources provide guidelines and standards that we apply to our work:

### **Publication Standards**
* **[Best Practices for ML in Geophysics](/pub_ml_rubric/)** – A comprehensive checklist for machine learning papers in geophysics, developed from editorial experience at GJI. Covers imaging, data processing, and Earth-system discovery studies.

### **Research & Writing Guidelines**
* **[Undergraduate Literature Review Guide](/teaching/ess499/)** – Guidelines for conducting structured literature reviews, including how to find sources, read strategically, and synthesize findings across traditional and ML approaches.

*Additional rubrics and standards for presentations and dissertation writing are under development and will be linked here.*

---

## Dissertations

Group **Ph.D. dissertations** are available here:

* **Congcong Yuan**, 2024, Harvard University – [dissertation](../downloads/Dissertation_Yuan_2024.pdf)
* **Stephanie Olinger**, 2023, Harvard University – [dissertation](../downloads/Dissertation_Olinger_2023.pdf)
* **Jiuxun Yin**, 2022, Harvard University – [dissertation](../downloads/Dissertation_Yin_2022.pdf)
* **Tim Clements**, 2021, Harvard University – [dissertation](../downloads/Dissertation_Clements_2021.pdf)

---

## Presentations

Recent group presentations at conferences and workshops:

* **SSA 2024** – [Denolle et al.: SCOPED Update](https://docs.google.com/presentation/d/1QL_yfaMfcH_zC1mIyAlHTM2ms2FX8yAN22WpA-l_suY/edit?usp=drive_link)

* **AGU 2023** – [Smoczyk et al.: Fingerprinting the Cascades Volcanoes](https://docs.google.com/presentation/d/1UWQBOy0hZhkFYCCskUeb0OuJrS-wzp4K/edit?usp=sharing&ouid=114363206559877755268&rtpof=true&sd=true)

* **AGU 2023** – [Denolle et al.: SCOPED Update](https://docs.google.com/presentation/d/1FMR0QH62oBuadAWXQ7ENPMEj7cuv9mORD41QSpwOlDs/edit?usp=sharing)

* **AGU 2023** – [Denolle et al.: Cloud Seismology](https://docs.google.com/presentation/d/1ekEv4T8Oanuv0EpwWBotoCTsu_N4cXc3iR9pp1TcBL0/edit?usp=sharing)

* **SCEC 2023** – [Denolle et al.: HPS CyberTraining](https://docs.google.com/presentation/d/1VXIdf3ocESIfkYW4MZHCzZ9mOdw-_eGYMFfE27CINJ0/edit?usp=sharing)

*A comprehensive archive of presentations with PDFs and video recordings is being compiled.*

---

## Peer-Reviewed Publications



{% assign number_printed = 0 %}
{% for publi in site.data.publist %}

{% assign even_odd = number_printed | modulo: 2 %}
{% if publi.highlight == 1 %}

{% if even_odd == 0 %}
<div class="row">
{% endif %}

<div class="col-sm-6 clearfix">
 <div class="well">
  <pubtit>{{ publi.title }}</pubtit>
  <img src="{{ site.url }}{{ site.baseurl }}/images/pubpic/{{ publi.image }}" class="img-responsive" width="33%" style="float: left" />
  <p>{{ publi.description }}</p>
  <p><em>{{ publi.authors }}</em></p>
  <p><strong><a href="{{ publi.url }}">{{ publi.journal }}</a></strong></p>
  <p class="text-danger"><strong> {{ publi.news1 }}</strong></p>
  <p> {{ publi.news2 }}</p>
 </div>
</div>

{% assign number_printed = number_printed | plus: 1 %}

{% if even_odd == 1 %}
</div>
{% endif %}

{% endif %}
{% endfor %}

{% assign even_odd = number_printed | modulo: 2 %}
{% if even_odd == 1 %}
</div>
{% endif %}

<p> &nbsp; </p>

For a more up-to-date list of publications: [Google Scholar](https://scholar.google.com/citations?user=GR8BOxsAAAAJ&hl=en)

---

<div class="publications">
{% for publi in site.data.publist %}
<div class="pub-item">
  <p class="pub-title">{{ publi.title }}</p>
  <p class="pub-authors">{{ publi.authors }}</p>
  <p class="pub-journal">{{ publi.journal }} ({% if publi.month %}{{ publi.month | capitalize }} {% endif %}{{ publi.year }}){% if publi.doi %} <span class="pub-doi">DOI: <a href="https://doi.org/{{ publi.doi }}" target="_blank">{{ publi.doi }}</a></span>{% endif %}</p>
  <div class="pub-links-container">
  <div class="pub-links">
  {% if publi.url %}<a href="{{ publi.url }}" target="_blank" class="pub-link-btn"><i class="fas fa-file-alt"></i> Paper</a>{% endif %}
  {% if publi.pdf %}<a href="{{ publi.pdf }}" target="_blank" class="pub-link-btn"><i class="fas fa-file-pdf"></i> PDF</a>{% endif %}
  {% if publi.code %}<a href="{{ publi.code }}" target="_blank" class="pub-link-btn"><i class="fas fa-code"></i> Code</a>{% endif %}
  {% if publi.bibtex %}<button class="pub-link-btn bibtex-btn" onclick="toggleBibtex('{{ publi.key }}')"><i class="fas fa-quote-right"></i> BibTeX</button>{% endif %}
  {% if publi.highlight %}<a href="{{ publi.highlight }}" target="_blank" class="pub-link-btn highlight-btn"><i class="fas fa-star"></i> Highlights</a>{% endif %}
  {% if publi.media %}<a href="{{ publi.media }}" target="_blank" class="pub-link-btn media-btn"><i class="fas fa-video"></i> Media</a>{% endif %}
  {% if publi.video %}<a href="{{ publi.video }}" target="_blank" class="pub-link-btn media-btn"><i class="fas fa-video"></i> Video</a>{% endif %}
  {% if publi.press_release %}{% for pr in publi.press_release %}{% if pr.url %}<a href="{{ pr.url }}" target="_blank" class="pub-link-btn press-btn"><i class="fas fa-newspaper"></i> {{ pr.text | default: "Press Release" }}</a>{% endif %}{% endfor %}{% endif %}
  </div>
  </div>
  {% if publi.bibtex %}
  <div class="bibtex-container" id="bibtex-{{ publi.key }}" style="display: none;">
  <pre id="bibtex-text-{{ publi.key }}" class="bibtex-text">{{ publi.bibtex }}</pre>
  <button class="copy-btn" onclick="copyBibtex('{{ publi.key }}')"><i class="fas fa-copy"></i> Copy citation</button>
  </div>
  {% endif %}
  {% if publi.tags.size > 0 %}
  <p class="pub-tags">
    Research areas: 
    {% for tag in publi.tags %}
    <a href="/research/#{{ tag }}" class="pub-tag">{{ tag }}</a>
    {% endfor %}
  </p>
  {% endif %}
</div>
{% endfor %}
</div>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<style>
.publications {
  margin: 2rem 0;
  font-size: 16px; /* Base font size for all publication elements */
}
.pub-item {
  margin-bottom: 20px;
  padding-bottom: 20px;
  border-bottom: 1px solid #eee;
}
.pub-item p {
  margin: 6px 0; /* Consistent margins for all paragraphs */
}
.pub-title {
  font-weight: bold;
  font-size: 1.1em;
  margin-top: 0;
}
.pub-authors {
  font-style: italic;
  font-size: 1em;
}
.pub-journal {
  color: #555;
  font-size: 1em;
}
.pub-doi {
  color: #666;
  font-size: 0.9em;
  margin-left: 8px;
  font-style: normal;
  display: inline-block;
  padding-left: 8px;
  border-left: 1px solid #ddd;
}
.pub-doi a {
  color: #0366d6;
  text-decoration: none;
  font-weight: normal;
}
.pub-doi a:hover {
  text-decoration: underline;
}
.pub-links-container {
  margin: 8px 0;
}
.pub-links {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
  align-items: center;
}
.pub-link-btn {
  display: inline-flex;
  align-items: center;
  gap: 5px;
  padding: 4px 10px;
  background: #f5f5f5;
  border-radius: 4px;
  color: #333;
  text-decoration: none;
  font-size: 0.85em;
  border: 1px solid #ddd;
  cursor: pointer;
  transition: all 0.2s ease;
}
.pub-link-btn:hover {
  background: #e8e8e8;
  border-color: #ccc;
}
.pub-link-btn i {
  font-size: 0.9em;
}
.highlight-btn {
  background-color: #fff8e6;
  border-color: #ffe0a6;
  color: #976500;
}
.highlight-btn:hover {
  background-color: #fff0d0;
  border-color: #ffd280;
}
.media-btn {
  background-color: #f0f0ff;
  border-color: #d0d0ff;
  color: #4040c0;
}
.media-btn:hover {
  background-color: #e0e0ff;
  border-color: #b0b0ff;
}
.pub-tags {
  margin-top: 12px;
  font-size: 0.9em;
}
.pub-tag {
  display: inline-block;
  margin-right: 8px;
  padding: 2px 6px;
  background: #f0f0f0;
  border-radius: 4px;
  color: #555;
  text-decoration: none;
  font-size: 0.9em;
}
.bibtex-container {
  background: #f8f8f8;
  padding: 15px;
  margin: 10px 0;
  border-radius: 6px;
  font-size: 0.85em;
  overflow-x: auto;
  position: relative;
  border: 1px solid #e0e0e0;
  box-shadow: 0 1px 3px rgba(0,0,0,0.05);
}
.bibtex-text {
  display: block;
  margin: 0;
  padding: 0;
  background: transparent;
  border: none;
  white-space: pre-wrap;
  font-family: Consolas, Monaco, 'Courier New', monospace;
  padding-bottom: 30px; /* Space for the copy button */
  overflow-x: auto;
  font-size: 0.9em;
  line-height: 1.4;
  text-align: left;
}
.copy-btn {
  position: absolute;
  bottom: 10px;
  right: 10px;
  padding: 5px 10px;
  background: #f0f0f0;
  border: 1px solid #ddd;
  border-radius: 4px;
  cursor: pointer;
  font-size: 0.85em;
  color: #555;
  transition: all 0.2s ease;
  display: flex;
  align-items: center;
  gap: 5px;
}
.copy-btn:hover {
  background: #e0e0e0;
  color: #333;
}
.fa-clipboard {
  margin-left: 4px;
}
</style>

<script>
function toggleBibtex(id) {
  const bibtex = document.getElementById(`bibtex-${id}`);
  if (bibtex.style.display === "none") {
    bibtex.style.display = "block";
    formatBibtexContent(id);
  } else {
    bibtex.style.display = "none";
  }
}

function formatBibtexContent(id) {
  const container = document.getElementById(`bibtex-text-${id}`);
  if (!container.dataset.formatted) {
    container.dataset.formatted = "true";
    
    try {
      // Clean up the content by normalizing whitespace
      let text = container.textContent;
      
      // Handle indentation more elegantly
      const lines = text.split('\n');
      const formattedLines = lines.map(line => line.trim());
      const formattedText = formattedLines.join('\n');
      
      // Format BibTeX with proper indentation
      const bibtexLines = formattedText.split('\n');
      let formatted = '';
      
      // Add proper indentation
      bibtexLines.forEach((line, index) => {
        if (index === 0) {
          // First line (e.g., @article{...})
          formatted += line + '\n';
        } else if (index === bibtexLines.length - 1 && line.trim() === '}') {
          // Last closing brace
          formatted += line;
        } else {
          // All other lines
          formatted += '  ' + line + '\n';
        }
      });
      
      container.textContent = formatted;
    } catch (e) {
      console.error("Error formatting BibTeX:", e);
    }
  }
}

function copyBibtex(id) {
  try {
    // Get the text container
    const container = document.getElementById(`bibtex-text-${id}`);
    
    // Create a temporary element to decode HTML entities
    const decoder = document.createElement('div');
    decoder.innerHTML = container.textContent;
    const bibtexText = decoder.textContent;
    
    // Create a temporary textarea element for copying
    const copyTextarea = document.createElement('textarea');
    copyTextarea.value = bibtexText;
    copyTextarea.style.position = 'fixed'; // Prevent scrolling to bottom
    document.body.appendChild(copyTextarea);
    copyTextarea.focus();
    copyTextarea.select();
    
    // Execute copy command
    document.execCommand('copy');
    
    // For modern browsers, also try the clipboard API
    if (navigator.clipboard) {
      navigator.clipboard.writeText(bibtexText);
    }
    
    // Get the button (might be the icon inside the button)
    let copyBtn = event.target;
    while (copyBtn.tagName !== 'BUTTON') {
      copyBtn = copyBtn.parentElement;
    }
    
    // Store original content and update
    const originalHTML = copyBtn.innerHTML;
    copyBtn.innerHTML = '<i class="fas fa-check"></i> Copied!';
    
    // Reset after delay
    setTimeout(function() {
      copyBtn.innerHTML = originalHTML;
    }, 1500);
  } catch (err) {
    console.error('Could not copy text: ', err);
    alert('Failed to copy to clipboard. Please try again.');
  }
  
  // Remove temporary element
  document.body.removeChild(copyTextarea);
}
</script>

<!-- Add filter buttons for research areas -->
<div class="filter-container">
  <button class="filter-btn active" data-filter="all">All</button>
  {% assign all_tags = "" | split: "" %}
  {% for pub in site.data.publist %}
    {% for tag in pub.tags %}
      {% unless all_tags contains tag %}
        {% assign all_tags = all_tags | push: tag %}
      {% endunless %}
    {% endfor %}
  {% endfor %}
  
  {% assign all_tags = all_tags | sort %}
  {% for tag in all_tags %}
    <button class="filter-btn" data-filter="{{ tag }}">{{ tag }}</button>
  {% endfor %}
</div>

<style>
.filter-container {
  margin: 2rem 0 1rem;
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
}
.filter-btn {
  padding: 6px 12px;
  background: #f5f5f5;
  border: 1px solid #ddd;
  border-radius: 20px;
  cursor: pointer;
  font-size: 0.9em;
}
.filter-btn.active {
  background: #333;
  color: #fff;
  border-color: #333;
}
</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
  // Format author names to remove commas between last and first names
  document.querySelectorAll('.pub-authors').forEach(element => {
    const authorText = element.textContent;
    
    // Split by commas to handle the "LastName, FirstName, LastName, FirstName" format
    // Typical format from BibTeX parsing: "Ni, Yiyu, Denolle, Marine, Thomas, Amanda"
    const parts = authorText.split(', ');
    const formattedAuthors = [];
    
    // Process each pair of "LastName, FirstName"
    for (let i = 0; i < parts.length; i += 2) {
      if (i + 1 < parts.length) {
        // Format as "FirstName LastName"
        formattedAuthors.push(parts[i + 1].trim() + ' ' + parts[i].trim());
      } else {
        // Handle any remaining odd part (should rarely happen)
        formattedAuthors.push(parts[i].trim());
      }
    }
    
    // Join all formatted authors with commas
    element.textContent = formattedAuthors.join(', ');
  });
  
  // Process all BibTeX containers on page load
  document.querySelectorAll('.bibtex-text').forEach(container => {
    try {
      // Get the raw content
      const rawContent = container.textContent;
      
      // Create a temporary element to decode HTML entities
      const decoder = document.createElement('div');
      decoder.innerHTML = rawContent;
      let decodedContent = decoder.textContent;
      
      // Format with proper indentation
      decodedContent = decodedContent.replace(/\s*\n\s*/g, '\n  ');
      
      // Set the formatted content
      container.textContent = decodedContent;
    } catch (e) {
      console.error("Error preprocessing BibTeX:", e);
    }
  });
  
  const filterButtons = document.querySelectorAll('.filter-btn');
  const publications = document.querySelectorAll('.pub-item');
  
  filterButtons.forEach(button => {
    button.addEventListener('click', function() {
      const filter = this.getAttribute('data-filter');
      
      // Toggle active class
      filterButtons.forEach(btn => btn.classList.remove('active'));
      this.classList.add('active');
      
      // Filter publications
      publications.forEach(pub => {
        const pubTags = Array.from(pub.querySelectorAll('.pub-tag')).map(tag => tag.textContent.trim());
        
        if (filter === 'all' || pubTags.includes(filter)) {
          pub.style.display = '';
        } else {
          pub.style.display = 'none';
        }
      });
    });
  });
  
  // Check if URL has a hash to filter by
  if (window.location.hash) {
    const filter = window.location.hash.substring(1);
    const button = document.querySelector(`.filter-btn[data-filter="${filter}"]`);
    if (button) {
      button.click();
    }
  }
});
</script>
