---
layout: member
id: anjani-mirchandani
title: "Anjani Mirchandani"
permalink: /people/anjani-mirchandani/
photo: anjani-mirchandani.jpg
short_description: "Undergraduate Student - Alaska Tomography using DAS"
email: ajm76@uw.edu
cv: 
website: 
scholar: 
orcid: 
github: https://github.com/ajm-glitch?tab=repositories
linkedin: http://www.linkedin.com/in/anjani-mirchandani
links: 
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
I am an undergraduate student majoring in Applied and Computational Math at the University of Washington. My passions lie at the intersection of math, ML, and earth sciences. Working in collaboration with the Denolle Lab at UW and the Wave Sensing Lab at Stanford, my current project is Distributed Acoustic Sensing (DAS)-based tomography, including eikonal-based travel-time modeling, tomographic inversion, and synthetic checkerboard resolution tests. In the past I have also worked on foundation models for DAS and a CNN binary classifier for orca vocalizations using hydrophone data.

My long-term goal is to integrate mathematical modeling, computational methods, and ML to accelerate scientific discovery in the earth and environmental sciences.

## Research - Disciplinary Interests
- Eikonal-based Tomography using Distributed Acoustic Sensing data
- ML and AI for scientific discovery

## Education
- B.S. in Applied and Computational Math, University of Washington, Seattle (2027)

## About Fun
I enjoy discovering new music, working out, reading, and visiting bookstores.
