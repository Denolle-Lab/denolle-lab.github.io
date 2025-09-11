---
layout: page
title: Earthquake Seismology
permalink: /research/earthquake-seismology/
---

![Earthquake Seismology](/images/researchpic/earthquake-seismology-banner.jpg)

## Overview

Earthquake seismology is at the core of our research in the Denolle Lab. We are dedicated to advancing our understanding of earthquakes through innovative observational techniques, large-scale data analysis, and physics-based modeling of earthquake dynamics and wave propagation.

Earthquakes represent one of Earth's most dynamic and impactful natural processes. By studying them, we not only gain insights into fundamental Earth processes but also develop better tools for hazard assessment and risk mitigation that can save lives and protect infrastructure.

## Research Focus

Our earthquake seismology research encompasses several complementary directions:

### Novel Detection and Characterization Methods

We develop and apply cutting-edge techniques to detect and characterize earthquakes across scales, from microseismicity to large destructive events. Using machine learning, array processing, and template matching approaches, we're expanding the earthquake catalog to include events previously hidden in noise, revealing new insights into fault behavior and crustal dynamics.

### Source Physics and Rupture Dynamics

Understanding the physics of earthquake nucleation, propagation, and arrest is central to predicting earthquake behavior. We use observations of earthquakes combined with theoretical and numerical models to investigate the factors controlling rupture complexity, energy release, and the emergence of different types of fault slip.

### Seismic Wavefield Analysis

Seismic waves carry rich information about both the earthquake source and the Earth structure they traverse. We apply advanced wavefield analysis techniques to extract this information, imaging the subsurface and resolving details of the rupture process that are otherwise inaccessible.

### Tectonic Implications

Our work with earthquakes provides insights into larger tectonic processes. By mapping seismicity patterns and understanding their relationship to crustal deformation, we contribute to knowledge about how plate tectonics operates and evolves over time.

## Key Papers

{% assign papers = site.data.publist | where: "tags", "earthquakes" %}
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

## Related Datasets and Tools

- [USGS Earthquake Catalog](https://earthquake.usgs.gov/earthquakes/search/) - Comprehensive catalog of earthquakes worldwide
- [SCEDC](https://scedc.caltech.edu/) - Southern California Earthquake Data Center
- [IRIS DMC](https://ds.iris.edu/ds/nodes/dmc/) - IRIS Data Management Center for seismic data

## Team Members

<div class="team-portrait-grid">
{% assign members = site.data.team_members %}
{% for member in members %}
{% if member.research_areas contains "earthquakes" %}
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
