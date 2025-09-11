---
layout: page
title: Environmental Seismology
permalink: /research/environmental-seismology/
---

![Environmental Seismology](/images/researchpic/environmental-seismology-banner.jpg)

## Overview

Environmental seismology leverages passive seismic techniques to monitor and understand environmental processes. In the Denolle Lab, we focus on using ambient seismic noise to characterize the hydromechanical properties of soils and monitor their temporal changes.

Ambient seismic noise is the continuous vibration of the Earth caused by various natural and anthropogenic sources. By analyzing these vibrations, we can infer information about the subsurface properties without the need for active seismic sources, making it a cost-effective and non-invasive technique for environmental monitoring.

## Research Focus

Our research in environmental seismology spans several key areas:

### Soil Hydromechanics

We investigate the relationship between soil moisture content and seismic wave velocity. As water saturation in soil changes, so does its mechanical properties, which affects seismic wave propagation. By monitoring these changes, we can track water movement in the subsurface and assess soil conditions crucial for agriculture and water resource management.

### Geohazard Monitoring

Landslides, soil liquefaction, and other geohazards often occur due to changes in soil conditions, particularly in response to precipitation events. We develop methods to identify precursory signals in ambient seismic noise that could help predict these hazards, contributing to early warning systems and risk mitigation strategies.

### Climate Change Impacts

Climate change alters precipitation patterns and soil moisture regimes. Our research helps quantify these changes and their impacts on soil stability and subsurface water storage, providing valuable data for adaptation and resilience planning.

## Key Papers

{% assign papers = site.data.publist | where: "tags", "environmental-seismology" %}
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

## Related Datasets

- [Dataset 1 Name](dataset-link) - Brief description
- [Dataset 2 Name](dataset-link) - Brief description

## Team Members

<div class="team-portrait-grid">
{% assign members = site.data.team_members %}
{% for member in members %}
{% if member.research_areas contains "environment" %}
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
