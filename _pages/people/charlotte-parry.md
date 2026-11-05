---
layout: member
id: charlotte-parry
title: "Charlotte Parry"
permalink: /people/charlotte-parry/
photo: charlotte-parry.jpg
short_description: "ECE undergraduate measuring shear-wave splitting at Mount Rainier"
email: cparry07@uw.edu
linkedin: https://www.linkedin.com/in/charlotte-parry-993b19369
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
Charlotte is an Electrical & Computer Engineering undergraduate doing an ESS 499 research project with Michael Hemmett. She is reproducing and extending shear-wave splitting measurements at Mount Rainier, with an emphasis on robust, reproducible measurements and their uncertainties.

## Research Interests
- Seismology
- Natural disaster monitoring
- Signal processing

## Education
- B.S. in Electrical & Computer Engineering - University of Washington, 2025-2029
