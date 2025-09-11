---
layout: page
title: Research
permalink: /research/
---

<p class="lead">We mainly use Earth vibrations, geophysical networks, and AI to monitor the environment and natural hazards. Click through for overviews, people, and recent work.</p>

<!-- Tag Filter Controls (auto-built from all tags) -->
<div id="tag-filter" class="tag-filter">
<button class="tag-btn active" data-tag="__all">All</button>
{% assign all_tags = "" | split: "" %}
{% assign research_files = site.data.research | sort %}
{% for research_file in research_files %}
{% assign area = research_file[1] %}
{% if area.tags %}
{% for t in area.tags %}
{% unless all_tags contains t %}
{% assign all_tags = all_tags | push: t %}
{% endunless %}
{% endfor %}
{% endif %}
{% endfor %}
{% assign all_tags = all_tags | sort_natural %}
{% for t in all_tags %}
<button class="tag-btn" data-tag="{{ t | escape }}">{{ t }}</button>
{% endfor %}
</div>

<!-- Areas Grid -->
<div class="grid" id="areas-grid">
{% assign areas = "" | split: "" %}
{% assign research_files = site.data.research | sort %}
{% for research_file in research_files %}
{% assign area = research_file[1] %}
{% assign area_key = research_file[0] %}
{% assign areas = areas | push: area %}
{% endfor %}
{% assign areas = areas | sort: 'order' %}

{% for area in areas %}
{% assign area_tags = area.tags | join: ' ' %}
<article class="card" data-tags="{{ area_tags }}">
{% if area.image %}
<img src="{{ area.image }}" alt="{{ area.title }}">
{% endif %}
<h3 id="{{ area.key | default: area_key }}">{{ area.title }}</h3>
{% if area.summary %}<p>{{ area.summary }}</p>{% endif %}
{% if area.links %}
<p class="btn-row">
{% for link in area.links %}
<a class="btn" href="{{ link.url }}">{{ link.text }}</a>
{% endfor %}
</p>
{% endif %}
{% assign research_key = area.key | default: area_key %}
{% assign team_members = site.data.team_members | where_exp: "member", "member.research_areas contains research_key" %}
{% if team_members.size > 0 %}
<div class="team-chips">
  {% for member in team_members limit:4 %}
  <a href="/people/{{ member.id }}/" class="team-chip" title="{{ member.name }}, {{ member.role }}">
    <img src="/images/teampic/{{ member.photo }}" alt="{{ member.name }}">
  </a>
  {% endfor %}
  {% if team_members.size > 4 %}
  <span class="team-chip more">+{{ team_members.size | minus: 4 }}</span>
  {% endif %}
</div>
{% endif %}
{% if area.tags %}
<div class="tags">
{% for t in area.tags %}<span class="tag">{{ t }}</span>{% endfor %}
</div>
{% endif %}
</article>
{% endfor %}
</div>

<style>
.lead { margin-bottom: 1rem; }
.tag-filter { display:flex; flex-wrap:wrap; gap:.5rem; margin:1rem 0 1.25rem; }
.tag-btn { border:1px solid #e5e7eb; border-radius:999px; padding:.35rem .7rem; cursor:pointer; background:#fff; }
.tag-btn.active { background:#111; color:#fff; border-color:#111; }
.grid { display:grid; gap:1.25rem; grid-template-columns:repeat(auto-fit,minmax(260px,1fr)); }
.card { border:1px solid #eee; border-radius:14px; padding:1rem; background:#fff; }
.card img { width:100%; height:150px; object-fit:cover; border-radius:10px; margin-bottom:.5rem; }
.btn-row .btn { display:inline-block; margin-right:.5rem; border:1px solid #e5e7eb; border-radius:8px; padding:.35rem .6rem; text-decoration:none; }
.tags { margin-top:.5rem; }
.tag { font-size:.8rem; background:#f5f5f5; padding:.2rem .5rem; border-radius:999px; margin-right:.25rem; }
.team-chips { display: flex; margin: 0.5rem 0; gap: 0.5rem; }
.team-chip { width: 35px; height: 35px; border-radius: 50%; overflow: hidden; display: block; border: 2px solid #fff; box-shadow: 0 1px 3px rgba(0,0,0,0.1); }
.team-chip img { width: 35px; height: 35px; object-fit: cover; margin: 0; padding: 0; border-radius: 0; }
.team-chip.more { background: #f0f0f0; color: #666; font-size: 0.7rem; display: flex; align-items: center; justify-content: center; }
</style>

<script>
(function() {
  const buttons = Array.from(document.querySelectorAll('#tag-filter .tag-btn'));
  const cards = Array.from(document.querySelectorAll('#areas-grid .card'));
  function apply(tag) {
    cards.forEach(card => {
      const tags = (card.getAttribute('data-tags') || '').toLowerCase().split(/\s+/);
      const show = (tag === '__all') || tags.includes(tag);
      card.style.display = show ? '' : 'none';
    });
    buttons.forEach(b => b.classList.toggle('active', b.dataset.tag.toLowerCase() === tag));
  }
  buttons.forEach(b => b.addEventListener('click', () => apply(b.dataset.tag.toLowerCase())));
  // allow /research/#ai to filter on load
  const initial = (location.hash || '').replace('#','').toLowerCase();
  if (initial) apply(initial);
})();
</script>
