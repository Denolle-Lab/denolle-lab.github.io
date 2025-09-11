---
layout: page
title: Geoscience and AI
permalink: /research/geoscience-and-ai/
---


![Geoscience and AI](/images/researchpic/geoscience-ai-banner.jpg)

## Overview

We are interested in leveraging AI advancements, the rise of sensor data, and state-of-the art scientific knowledge can support a predictive understanding of **geohazards** (earthquake ground motions, landslides, flash floods, wildfires) **in a changing climate**. 

We develop AI tools for:
* Physics-aware reduced order models of complex physics (e.g., wavefield simulations).
* Event monitoring, developing deep learning models to detect, classify, and characterize geohazards from geophysical sensor data.
* Develop data fusion methods for gridded data set (imagery or models) with time series data.
* Develop data assimilation framework for forecasting these hazards.
* Develop agentic framework to automate research workflow and cross disciplinary boundaries.

Our style of research is to have minimal neural network architectures for low cost development and interpretability, so that they can be applied on peta-scale data at low cost.
 
## Research Focus

Our Geoscience-AI research spans several interdisciplinary domains:
* Physics-Aware Machine Learning
* Earth System Modeling for Extreme Event, especially in compounding-cascading hazard assessments
* Data fusion of imagery and in-situ sensor data
* Agentic Framework to cross disciplinary boundaries


## Key Papers

{% assign papers = site.data.publist | where: "tags", "geoscience-ai" %}
<div class="publications">
{% for paper in papers %}
<div class="pub-item">
  <div class="pub-title">{{ paper.title }}</div>
  <div class="pub-authors">{{ paper.authors }}</div>
  <div class="pub-journal">{{ paper.journal }}</div>
  <div class="pub-links">
    {% if paper.url %}<a href="{{ paper.url }}" target="_blank">Paper</a>{% endif %}
    {% if paper.doi %}<a href="https://doi.org/{{ paper.doi }}" target="_blank">DOI</a>{% endif %}
    {% if paper.pdf %}<a href="{{ paper.pdf }}" target="_blank">PDF</a>{% endif %}
    {% if paper.code %}<a href="{{ paper.code }}" target="_blank">Code</a>{% endif %}
    {% if paper.bibtex %}<button class="bibtex-btn" onclick="toggleBibtex('{{ paper.id }}')">BibTeX</button>{% endif %}
  </div>
  {% if paper.bibtex %}
  <div class="bibtex-container" id="bibtex-{{ paper.id }}" style="display: none;">
    <pre>{{ paper.bibtex }}</pre>
  </div>
  {% endif %}
</div>
{% endfor %}
</div>

## Related Resources

- [GeoSmart](https://geo-smart.github.io/)
- [MLGEO JupyterBook](https://geo-smart.github.io/mlgeo-book/about_this_book/about_this_book.html)

## Team Members

<div class="team-portrait-grid">
{% assign members = site.data.team_members %}
{% for member in members %}
{% if member.research_areas contains "geoscience-ai" %}
<div class="team-portrait">
<a href="/people/{{ member.id }}/">
<img src="/images/teampic/{{ member.photo }}" alt="{{ member.name }}">
<span class="member-name">{{ member.name }}</span>
</a>
</div>
{% endif %}
{% endfor %}
</div>

<script>
function toggleBibtex(id) {
  const bibtex = document.getElementById(`bibtex-${id}`);
  if (bibtex.style.display === "none") {
    bibtex.style.display = "block";
  } else {
    bibtex.style.display = "none";
  }
}
</script>

<style>
.pub-item {
  margin-bottom: 20px;
  padding-bottom: 20px;
  border-bottom: 1px solid #eee;
}
.pub-title {
  font-weight: bold;
}
.pub-authors {
  font-style: italic;
  margin: 5px 0;
}
.pub-journal {
  margin-bottom: 5px;
}
.pub-links a, .bibtex-btn {
  display: inline-block;
  margin-right: 10px;
  padding: 3px 8px;
  background: #f5f5f5;
  border-radius: 4px;
  color: #333;
  text-decoration: none;
  font-size: 0.8em;
  border: 1px solid #ddd;
  cursor: pointer;
}
.bibtex-container {
  background: #f8f8f8;
  padding: 10px;
  margin: 10px 0;
  border-radius: 4px;
  font-size: 0.8em;
  overflow-x: auto;
}
</style>
