---
title: "Denolle Lab - People"
layout: gridlay
excerpt: "Denolle Lab: People"
sitemap: false
permalink: /people/
---

# People
---

<div class="container">
<div class="row">
{% for member in site.data.team_members %}
<div class="col-md-2 col-sm-2 mb-2" style="padding-left:8px;padding-right:8px;">
<div class="card text-center" style="margin-bottom:16px;">
<a href="{{ site.baseurl }}/people/{{ member.id }}/">
<img src="{{ site.baseurl }}/images/teampic/{{ member.photo }}" class="rounded-circle mx-auto d-block" style="width:150px;height:150px;object-fit:cover;" alt="{{ member.name }}">
</a>
<div class="card-body">
<h5 class="card-title">{{ member.name }}</h5>
<p class="role-text fs-5 fw-semibold text-secondary mb-3">{{ member.role }}</p>
<p class="card-text">{{ member.short_description }}</p>
{% if member.cv %}
<a href="{{ member.cv }}" class="btn btn-outline-primary btn-sm" target="_blank">CV</a>
{% endif %}
{% if member.email %}
<a href="mailto:{{ member.email }}" class="btn btn-outline-secondary btn-sm">Email</a>
{% endif %}
{% if member.website %}
<a href="{{ member.website }}" class="btn btn-outline-info btn-sm" target="_blank">Website</a>
{% endif %}
{% if member.scholar %}
<a href="{{ member.scholar }}" target="_blank">📚</a>
{% endif %}
{% if member.orcid %}
<a href="{{ member.orcid }}" target="_blank">🟢</a>
{% endif %}
{% if member.github %}
<a href="{{ member.github }}" target="_blank"><img src="https://cdn.jsdelivr.net/gh/simple-icons/simple-icons/icons/github.svg" width="20" alt="GitHub"></a>
{% endif %}
{% if member.linkedin %}
<a href="{{ member.linkedin }}" target="_blank"></a>
{% endif %}
{% if member.email %}
<a href="mailto:{{ member.email }}">✉️</a>
{% endif %}
</div>
</div>
</div>
{% endfor %}
</div>
</div>

---

## Join Our Team

We are always looking for talented and enthusiastic individuals to join our team! Here's how you can apply:

### Graduate Students
We welcome applications from prospective graduate students interested in geophysics and data science research. Before applying, please:
- Read our [group guidelines](https://github.com/Denolle-Lab/working_as_a_group/blob/main/onboarding.md)
- Review the [ESS graduate program application process](https://ess.uw.edu/education/graduate-program/how-to-apply/)
- I recommend still to take GRE (even if not required), TOEFL etc. 
- Email Marine directly to discuss your research interests before applying

### Undergraduate Researchers
We actively support undergraduate research experiences! Several specific projects are available, and we offer:
- Hourly-rate compensation throughout the year depending on projects
- Opportunities for fellowship applications
- Mentorship and guidance on research projects
- Check our [undergraduate research projects](https://docs.google.com/document/d/1z9Qbx1dYNyfoMFFRE5Gmry2erZa7y5h8zgLSRjc-v_M/edit?usp=sharing)

### Postdoctoral Researchers
Currently, we do not have open postdoctoral positions due to limited funds. However, you are welcome to reach out regarding future opportunities or fellowship applications.

### Visiting Researchers
If you are interested in visiting our lab for a few months (with or without your own funding), please email Marine to discuss possibilities.