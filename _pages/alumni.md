---
title: "Denolle Lab - Former Members"
layout: gridlay
excerpt: "Denolle Lab: Former group members"
sitemap: false
permalink: /alumni/
---

# Former Group Members

People who trained or worked in the group at Harvard (2015–2020) and at the University of Washington (2020–). Back to [current members]({{ site.baseurl }}/people/).

{% assign sections = "postdocs|Postdoctoral Researchers,graduate|Graduate Students,undergraduate|Undergraduate Researchers,affiliated|Affiliated Graduate Students" | split: "," %}
{% for section in sections %}
{% assign parts = section | split: "|" %}
{% assign key = parts[0] %}
{% assign heading = parts[1] %}
{% assign people = site.data.former_members | where: "group", key %}
{% if people.size > 0 %}

## {{ heading }}

<div class="row member-grid">
{% for member in people %}
<div class="col-md-3 col-sm-4 mb-3" style="padding-left:8px;padding-right:8px;">
<div class="card text-center alumni-card">
{% if member.page %}<a href="{{ site.baseurl }}{{ member.page }}">{% elsif member.website %}<a href="{{ member.website }}" target="_blank" rel="noopener">{% endif %}
<img src="{{ site.baseurl }}/images/teampic/{{ member.photo | default: 'littlequake.png' }}" class="rounded-circle mx-auto d-block" style="width:110px;height:110px;object-fit:cover;" alt="{{ member.name }}">
{% if member.page or member.website %}</a>{% endif %}
<div class="card-body">
<h5 class="card-title">{{ member.name }}</h5>
<p class="role-text text-secondary">{{ member.role }}{% if member.years %} · {{ member.years }}{% endif %}</p>
{% if member.degree %}<p class="card-text small">{{ member.degree }}</p>{% endif %}
{% if member.research %}<p class="card-text small">{{ member.research }}</p>{% endif %}
{% if member.now %}<p class="card-text small"><strong>Now:</strong> {{ member.now }}</p>{% endif %}
{% if member.page %}<a href="{{ site.baseurl }}{{ member.page }}" class="btn btn-outline-primary btn-sm">Profile</a>{% endif %}
{% if member.website %}<a href="{{ member.website }}" class="btn btn-outline-info btn-sm" target="_blank" rel="noopener">Website</a>{% endif %}
{% if member.github %}<a href="{{ member.github }}" target="_blank" rel="noopener" title="GitHub"><img src="https://cdn.jsdelivr.net/gh/simple-icons/simple-icons/icons/github.svg" width="18" alt="GitHub"></a>{% endif %}
</div>
</div>
</div>
{% endfor %}
</div>
{% endif %}
{% endfor %}
