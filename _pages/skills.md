---
layout: page
title: Lab Skills
permalink: /skills/
---

<p class="lead">A shared, living collection of skill specifications for the Denolle Lab — covering AI/Copilot agents for lab tasks, seismology methods, data analysis workflows, and writing guides. All files are open, versioned, and discussable on GitHub.</p>

<div class="skills-meta">
  <a class="btn btn-primary" href="https://github.com/Denolle-Lab/lab-skills" target="_blank">View on GitHub</a>
  <a class="btn" href="https://github.com/Denolle-Lab/lab-skills/discussions" target="_blank">Discussions</a>
  <a class="btn" href="https://github.com/Denolle-Lab/lab-skills/issues/new/choose" target="_blank">Propose a skill</a>
</div>

<!-- Category filter -->
<div id="cat-filter" class="tag-filter">
  <button class="tag-btn active" data-cat="__all">All</button>
  <button class="tag-btn" data-cat="ai-tools">AI tools</button>
  <button class="tag-btn" data-cat="research-methods">Research methods</button>
  <button class="tag-btn" data-cat="data-analysis">Data analysis</button>
  <button class="tag-btn" data-cat="writing">Writing</button>
</div>

<!-- Skills grid -->
<div class="grid" id="skills-grid">
{% assign active_skills = site.data.skills | where: "status", "active" %}
{% assign draft_skills  = site.data.skills | where: "status", "draft" %}
{% assign all_skills = active_skills | concat: draft_skills %}

{% for skill in all_skills %}
<article class="card" data-cat="{{ skill.category }}">
  <div class="skill-cat-badge cat-{{ skill.category }}">{{ skill.category | replace: "-", " " }}</div>
  <h3>{{ skill.title }}</h3>
  <p>{{ skill.description }}</p>
  {% if skill.tags %}
  <div class="tags">
    {% for t in skill.tags %}<span class="tag">{{ t }}</span>{% endfor %}
  </div>
  {% endif %}
  <p class="btn-row" style="margin-top:.75rem;">
    <a class="btn" href="{{ skill.github_url }}" target="_blank">View file</a>
    <a class="btn" href="https://github.com/Denolle-Lab/lab-skills/discussions" target="_blank">Discuss</a>
  </p>
  {% if skill.status == "draft" %}
  <span class="draft-badge">draft</span>
  {% endif %}
</article>
{% endfor %}
</div>

<p style="margin-top:2rem; font-size:.9rem; color:#777;">
  Skills live in <a href="https://github.com/Denolle-Lab/lab-skills" target="_blank">Denolle-Lab/lab-skills</a>.
  To add or improve a skill, open an issue or start a Discussion there.
  Built on the <a href="https://github.com/mdenolle/academic-practice-agents" target="_blank">academic-practice-agents</a> framework.
</p>

<style>
.lead { margin-bottom: 1rem; }
.skills-meta { display: flex; flex-wrap: wrap; gap: .5rem; margin-bottom: 1.25rem; }
.skills-meta .btn-primary { background: #111; color: #fff; border-color: #111; }
.tag-filter { display:flex; flex-wrap:wrap; gap:.5rem; margin:1rem 0 1.25rem; }
.tag-btn { border:1px solid #e5e7eb; border-radius:999px; padding:.35rem .7rem; cursor:pointer; background:#fff; }
.tag-btn.active { background:#111; color:#fff; border-color:#111; }
.grid { display:grid; gap:1.25rem; grid-template-columns:repeat(auto-fit,minmax(280px,1fr)); }
.card { border:1px solid #eee; border-radius:14px; padding:1rem 1.1rem; background:#fff; position:relative; }
.skill-cat-badge { display:inline-block; font-size:.72rem; font-weight:600; text-transform:uppercase; letter-spacing:.04em; padding:.2rem .55rem; border-radius:999px; margin-bottom:.5rem; }
.cat-ai-tools        { background:#e0f0ff; color:#0057a8; }
.cat-research-methods{ background:#e6f9f0; color:#1a7a4a; }
.cat-data-analysis   { background:#fff3e0; color:#8a4f00; }
.cat-writing         { background:#f3e8ff; color:#6b21a8; }
.btn-row .btn { display:inline-block; margin-right:.4rem; border:1px solid #e5e7eb; border-radius:8px; padding:.35rem .6rem; text-decoration:none; font-size:.875rem; }
.tags { margin-top:.4rem; }
.tag { font-size:.78rem; background:#f5f5f5; padding:.2rem .5rem; border-radius:999px; margin-right:.2rem; display:inline-block; margin-top:.2rem; }
.draft-badge { position:absolute; top:.75rem; right:.75rem; font-size:.7rem; background:#fef9c3; color:#854d0e; padding:.15rem .45rem; border-radius:999px; font-weight:600; }
</style>

<script>
(function() {
  const buttons = Array.from(document.querySelectorAll('#cat-filter .tag-btn'));
  const cards   = Array.from(document.querySelectorAll('#skills-grid .card'));
  function apply(cat) {
    cards.forEach(card => {
      const show = (cat === '__all') || card.getAttribute('data-cat') === cat;
      card.style.display = show ? '' : 'none';
    });
    buttons.forEach(b => b.classList.toggle('active', b.dataset.cat === cat));
  }
  buttons.forEach(b => b.addEventListener('click', () => apply(b.dataset.cat)));
  const initial = (location.hash || '').replace('#', '').toLowerCase();
  if (initial && initial !== '') apply(initial);
})();
</script>
