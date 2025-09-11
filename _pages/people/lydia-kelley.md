---
layout: member
id: lydia-kelley
title: "Lydia Kelley"
permalink: /people/lydia-kelley/
photo: lydia-kelley.jpg
short_description: "Undergraduate Researcher - Investigating Tectonic Signals in Offshore Cascadia"
email: lydiagk@uw.edu
resume: /downloads/lydia_kelley_resume.pdf
linkedin: www.linkedin.com/in/lydia-g-kelley
---

# Lydia Kelley

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
{% if page.cv %}<a href="{{ page.cv }}" target="_blank" title="CV">📄</a>{% endif %}
</div>
</div>
</div>

---

## About Me
I’m a senior in oceanography and an undergraduate researcher at the University of Washington, where I study tectonic processes in the Offshore Cascadia using ocean bottom seismometers. My work focuses on classifying tectonic signals to better understand the locking state of the Cascadia Subduction Zone. I also work hands-on with ocean technology to investigate changes in physical ocean properties. I aim t is grounded in a commitment to advancing scientific knowledge while supporting communities facing the growing challenges of climate change.

## Research - Disciplinary Interests
- Locking State of the Cascadia Subduction Zone
- Evolution of ENSO events over time
- Remote Oceanographic Sensors

## Education
- B.S in Oceanography, University of Washington, USA

## About Fun
I like to sail, swim, and do anything where I can be outside and close to water. 
---
