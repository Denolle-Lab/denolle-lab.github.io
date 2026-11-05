---
layout: member
id: sangwoo-han
title: "Sangwoo Han"
permalink: /people/sangwoo-han/
photo: sangwoo-han.png
short_description: "Postdoctoral Researcher - Seismologist"
email: sangwooh@uw.edu
website: https://seismic-wave-han.github.io
scholar: https://scholar.google.com/citations?user=--qiqDYAAAAJ
orcid: https://orcid.org/0000-0001-5832-7127
github: https://github.com/Seismic-wave-Han
---

<div style="display: flex; align-items: center; gap: 2rem;flex-wrap: wrap;">
<img src="{{ site.baseurl }}/images/teampic/{{ page.photo }}" class="rounded-circle" style="width:160px;height:160px;object-fit:cover;border:3px solid #eee;" alt="{{ page.title }}">
<div>
<h2 style="margin-bottom:0.5rem;">{{ page.title }}</h2>
<span style="font-size:1.1rem; color:#555;">{{ page.short_description }}</span><br>
{% assign member = site.data.team_members | where: "id", page.id | first %}
<span style="font-size:1rem; color:#888;">{{ member.role }}</span>
<div style="margin-top:1rem;">
{% if page.website %}<a href="{{ page.website }}" target="_blank" title="Website">🌐</a>{% endif %}
{% if page.scholar %}<a href="{{ page.scholar }}" target="_blank" title="Google Scholar">{{ site.scholar_icon | raw }}</a>{% endif %}
{% if page.orcid %}<a href="{{ page.orcid }}" target="_blank" title="ORCID">{{ site.orcid_icon | raw }}</a>{% endif %}
{% if page.github %}<a href="{{ page.github }}" target="_blank" title="GitHub">{{ site.github_icon | raw }}</a>{% endif %}
{% if page.linkedin %}<a href="{{ page.linkedin }}" target="_blank" title="LinkedIn">{{ site.linkedin_icon | raw }}</a>{% endif %}
{% if page.email %}<a href="mailto:{{ page.email }}" title="Email">✉️</a>{% endif %}
{% if page.cv %}<a href="{{ page.cv }}" target="_blank" title="Download CV" class="btn btn-sm btn-default" style="margin-left: 0.5rem;">📄 Download CV</a>{% endif %}
</div>
</div>
</div>

---

## About Me
I am a seismologist and a postdoctoral researcher working on multi-hazard, multi-sensor monitoring at Mount Rainier. I study volcano-tectonic earthquakes, focusing on fault activation and stress changes during the 2025 swarm beneath the summit, as well as surface events from ice–water–rock interactions and avalanche dynamics using seismometers and infrasound sensors.

I received my Ph.D. in Seismology and Geophysics from Seoul National University in 2026, where my research used dense seismic arrays and distributed acoustic sensing (DAS) to resolve fault structure and earthquake rupture complexity at sub-kilometer scales. I apply these methods to intraplate regions, plate boundaries, volcanic seismic zones, and earthquakes induced by enhanced geothermal systems (EGS).

## Research - Disciplinary Interests
- Earthquake physics & source analysis
- Utilization of DAS & dense nodal/broadband arrays
- Software development for seismology & geophysics
- Multi-sensor hazard monitoring at Mount Rainier

## Education
- Ph.D. in Seismology and Geophysics, Seoul National University, Korea, 2021–2026
- B.S. in Earth and Environmental Sciences; B.S. in Computational Sciences, Seoul National University, Korea, 2014–2021

## More Links
- [Paros Geohazards Center](https://www.parosgeohazardscenter.uw.edu/)

## About Fun
I enjoy playing soccer, table tennis, and guitar.
