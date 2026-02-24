---
layout: member
id: jane-doe
title: "Jane Doe"
permalink: /people/jane-doe/
photo: jane.jpg
short_description: "Glaciologist, interested in ice dynamics and climate."
email: jane@uw.edu
cv: /downloads/JaneDoe_CV.pdf
website: https://janedoe.com
scholar: https://scholar.google.com/citations?user=JaneDoe
orcid: https://orcid.org/0000-0000-0000-0000
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

## About
Jane is a glaciologist interested in ice dynamics and climate. Her research focuses on...

## Research Interests
- Ice sheet modeling
- Climate change
- Remote sensing

## Education
- Ph.D. in Glaciology - University of Washington, USA, 2023
- M.S. in Earth Sciences - Stanford University, USA, 2020
- B.S. in Geophysics - University of California, Berkeley, USA, 2018

## Selected Publications
- Doe, J. et al. "Ice Sheet Dynamics in a Warming World." *Nature*, 2024.
- Doe, J. et al. "Remote Sensing of Polar Regions." *Science*, 2023.
