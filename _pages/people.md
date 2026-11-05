---
title: "Denolle Lab - People"
layout: gridlay
excerpt: "Denolle Lab: People"
sitemap: false
permalink: /people/
---

# People

<div class="row member-grid">
{% for member in site.data.team_members %}
<div class="col-md-3 col-sm-3 mb-3" style="padding-left:8px;padding-right:8px;">
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

<p>Former postdocs, students, and affiliated researchers are listed on the <a href="{{ site.baseurl }}/alumni/">former members page</a>.</p>

---

## Collaborators

Active collaborations at the University of Washington. Units are listed rather than titles.

<ul class="collaborator-list">
{% for c in site.data.collaborators %}
<li><a href="{{ c.url }}" target="_blank" rel="noopener">{{ c.name }}</a> <span class="text-secondary">· {{ c.unit }}</span></li>
{% endfor %}
</ul>

---

## Join Our Team

Interested in joining the group? Here is how to apply. The [openings page]({{ site.baseurl }}/openings) has the current advising context and the rubric used to read graduate applications.

### Graduate Students
Marine reviews graduate applications when advising capacity and funding permit. She expects to be at ETH Zürich during the 2027–28 academic year, so a Fall 2027 starter should read the [advising context]({{ site.baseurl }}/openings#advising-context) first. Before applying, please:
- Read our [group guidelines](https://github.com/Denolle-Lab/Group_Utils/blob/main/onboarding.md)
- Review the [ESS graduate program application process](https://ess.uw.edu/admissions/how-to-apply/). GRE scores are not considered. Applicants who are not U.S. citizens and whose native language is not English need TOEFL or an equivalent test; see the [UW Graduate School English proficiency policy](https://grad.uw.edu/policies/3-2-graduate-school-english-language-proficiency-requirements/) for accepted tests and exemptions.
- You are welcome to email Marine about research fit before applying. This is her preference, not an ESS requirement, and it is not scored.

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
