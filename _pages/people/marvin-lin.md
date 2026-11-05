---
layout: member
id: marvin-lin
title: "Marvin Lin"
permalink: /people/marvin-lin/
photo: lin-marvin.png
short_description: "CS undergraduate researcher building knowledge graph of geosciences"
email: marzlin@uw.edu
cv: 
website:
scholar: 
orcid: 
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
Marvin is a undergraduate student studying Computer Science. He joined the group in Fall 2026 is interested in applying CS to the geosciences. Currently, he is working on building a knowledge graph of geoscience to support our agentic research workflows.

## Research Interests
- Machine learning applications for science
- Knowledge graphs

## Education
- B.S. in Computer Science - University of Washington, 2025-Present
