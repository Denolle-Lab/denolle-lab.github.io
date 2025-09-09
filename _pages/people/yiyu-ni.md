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
<span style="font-size:1rem; color:#888;">Graduate Student</span>
<div style="margin-top:1rem;">
{% if page.website %}<a href="{{ page.website }}" target="_blank" title="Website">🌐</a>{% endif %}
{% if page.scholar %}<a href="{{ page.scholar }}" target="_blank" title="Google Scholar">{{ site.scholar_icon | raw }}</a>{% endif %}
{% if page.github %}<a href="{{ page.github }}" target="_blank" title="GitHub">{{ site.github_icon | raw }}</a>{% endif %}
{% if page.linkedin %}<a href="{{ page.linkedin }}" target="_blank" title="LinkedIn">{{ site.linkedin_icon | raw }}</a>{% endif %}
{% if page.email %}<a href="mailto:{{ page.email }}" title="Email">✉️</a>{% endif %}
{% if page.cv %}<a href="{{ page.cv }}" target="_blank" title="CV">📄</a>{% endif %}
</div>
</div>
</div>

---

## Research Interests
- Earthquake monitoring
- Computational and seismology
- Machine Learning

## Education
- B.S. in Geophysics - Jilin University, China, 2020