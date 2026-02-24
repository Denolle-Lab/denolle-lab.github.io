---
layout: member
id: yiyu-ni
title: "Yiyu Ni"
permalink: /people/yiyu-ni/
photo: yiyu-ni.jpg
short_description: "Ph.D. Candidate in Seismology"
email: niyiyu@uw.edu
website: https://niyiyu.github.io
scholar: https://scholar.google.com/citations?user=FLu0PP4AAAAJ&hl=en
github: https://github.com/niyiyu
linkedin: https://www.linkedin.com/in/yiyu-ni-501441182/
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
{% if page.github %}<a href="{{ page.github }}" target="_blank" title="GitHub">{{ site.github_icon | raw }}</a>{% endif %}
{% if page.linkedin %}<a href="{{ page.linkedin }}" target="_blank" title="LinkedIn">{{ site.linkedin_icon | raw }}</a>{% endif %}
{% if page.email %}<a href="mailto:{{ page.email }}" title="Email">✉️</a>{% endif %}
{% if page.cv %}<a href="{{ page.cv }}" target="_blank" title="Download CV" class="btn btn-sm btn-default" style="margin-left: 0.5rem;">📄 Download CV</a>{% endif %}
</div>
</div>
</div>

---

## About 
I am currently a Ph.D. candidate in the Department of [Earth and Space Sciences (ESS)](https://ess.washington.edu), and also a duty seismologist at [Pacific Northwest Seismic Network (PNSN)](https://pnsn.org). 

The overall goal of my research is to advance data-driven earthquakes and structure monitoring in the Pacific Northwest of the United States by leveraging heterogeneous datasets from traditional seismic stations and fiber-optic sensing. Another focus of my research is to utilize advance tools like cloud computing and machine learning for seismic big data processing.

## Research Interests
- Earthquake monitoring in the Pacific Northwest
- Computational seismology
- Machine Learning

## Education
- B.S. in Geophysics - Jilin University, China, 2020