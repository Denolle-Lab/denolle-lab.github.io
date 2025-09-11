---
title: "Denolle Lab at UW"
layout: homelay
excerpt: "Denolle Lab at University of Washington."
sitemap: false
permalink: /
---

# Geophysics - Geohazards - AI

We aim to transform our understanding of geohazards by combining big data, advanced seismological tools, and insights from climate and hydrological sciences. Our research not only uncovers the processes that drive earthquakes, landslides, and other hazards, but also reveals how a changing climate reshapes Earth’s subsurface and impacts society and the environment.

<div markdown="0" id="carousel" class="carousel slide" data-ride="carousel" data-interval="4000" data-pause="hover" >
    <!-- Menu -->
    <ol class="carousel-indicators">
        <li data-target="#carousel" data-slide-to="0" class="active"></li>
        <li data-target="#carousel" data-slide-to="1"></li>
        <li data-target="#carousel" data-slide-to="2"></li>
        <li data-target="#carousel" data-slide-to="3"></li>
        <li data-target="#carousel" data-slide-to="4"></li>
        <li data-target="#carousel" data-slide-to="5"></li>
        <li data-target="#carousel" data-slide-to="6"></li>
    </ol>

    <!-- Items -->
    <div class="carousel-inner" markdown="0">
        <div class="item active">
            <img src="{{ site.url }}{{ site.baseurl }}/images/researchpic/clements_dv.jpg" alt="Slide 1" />
        </div>
        <div class="item">
            <img src="{{ site.url }}{{ site.baseurl }}/images/researchpic/F7_cartoon_single.jpg" alt="Slide 2" />
        </div>
        <div class="item">
            <img src="{{ site.url }}{{ site.baseurl }}/images/researchpic/phase_picking.jpg" alt="Slide 3" />
        </div>
    </div>
  <a class="left carousel-control" href="#carousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>



Central to our mission is the development of low-compute, massive scalability, fully reproducible research workflows that facilitate seamless collaboration and reproducibility across scientific domains (see our **[Github](https://github.com/Denolle-Lab)**). We are committed to fostering a culture of continuous learning and innovation, empowering our members to embrace modern technologies and AI-aided software practices. 
<!-- We  contribute to open curriculum (e.g., [Machine Learning in the Geosciences](https://geo-smart.github.io/mlgeo-book/about_this_book/about_this_book.html)) and **[UW Geophysics YouTube Channel](https://www.youtube.com/@uwgeophysics6888)** and the **[SCOPED YouTube Channel](https://www.youtube.com/@scoped6259)**.  -->

<!-- Through our collective efforts, we envision a future where the fusion of data-driven insights and interdisciplinary collaboration leads to more resilient communities and a sustainable planet. Join us as we embark on this journey to shape the future of geohazard research and its societal relevance. -->

Our mantra encapsulates our commitment to:

* Discovering and characterizing geohazards through big data analysis.
* Transforming seismology to address pressing societal challenges.
* Empowering our members through modern AI-aided practices and open-source workflows.


# Research Preview
{% include research_preview_section.html title=false %}

<!-- ***SSA UPDATES***
* SSA 2024 **[Denolle et al, 2024: SCOPED Update](https://docs.google.com/presentation/d/1QL_yfaMfcH_zC1mIyAlHTM2ms2FX8yAN22WpA-l_suY/edit?usp=drive_link)**

***AGU UPDATES*** 
Group Presentations to conferences 
* AGU 2023 **[Smoczyk et al., 2023, FingerPrinting the Cascades Volcanoes](https://docs.google.com/presentation/d/1UWQBOy0hZhkFYCCskUeb0OuJrS-wzp4K/edit?usp=sharing&ouid=114363206559877755268&rtpof=true&sd=true)**.

* AGU 2023 **[Denolle et al., 2023, SCOPED Update](https://docs.google.com/presentation/d/1FMR0QH62oBuadAWXQ7ENPMEj7cuv9mORD41QSpwOlDs/edit?usp=sharing)**.

* AGU 2023 **[Denolle et al., 2023, Cloud Seismology](https://docs.google.com/presentation/d/1FMR0QH62oBuadAWXQ7ENPMEj7cuv9mORD41QSpwOlDs/edit?uhttps://docs.google.com/presentation/d/1ekEv4T8Oanuv0EpwWBotoCTsu_N4cXc3iR9pp1TcBL0/edit?usp=sharing)**.

* SCEC 2023 **[Denolle et al., 2023, HPS CyberTraining](https://docs.google.com/presentation/d/1VXIdf3ocESIfkYW4MZHCzZ9mOdw-_eGYMFfE27CINJ0/edit?usp=sharing)**. -->



We are located in Seattle, WA, at the University of Washington, in the heart of the Pacific Northwest (PNW). The PNW is a wonderful natural laboratory to monitor earthquakes, landslides, volcanoes, glaciers, and more broadly speaking the subduction-zone environment.

 **We are looking for new graduate students, postdocs, and undergraduate researcher** [(more info)]({{ site.url }}{{ site.baseurl }}/openings) **!**

<script>
(function(){
  const els = document.querySelectorAll('.reveal-on-scroll');
  const obs = new IntersectionObserver((entries)=>{
    entries.forEach(e=>{
      if(e.isIntersecting){
        e.target.classList.add('revealed');
        obs.unobserve(e.target);
      }
    });
  }, { threshold: 0.15 });
  els.forEach(el=>obs.observe(el));
})();
</script>
<style>
.reveal-on-scroll { opacity: 0; transform: translateY(12px); transition: opacity .5s ease, transform .5s ease; }
.reveal-on-scroll.revealed { opacity: 1; transform: none; }
</style>

