---
title: "Denolle Quake Lab - Publications"
layout: gridlay
excerpt: "Denolle Quake Lab -- Publications."
sitemap: false
permalink: /publications/
---


# Publications
---
<!-- ## Group highlights -->

The group **Ph.D dissertations** are available:

* Congcong Yuan, 2024, Harvard University, [dissertation](../downloads/Dissertation_Yuan_2024.pdf)
* Stephanie Olinger, 2023, Harvard University, [dissertation](../downloads/Dissertation_Olinger_2023.pdf)
* Jiuxun Yin, 2022, Harvard University, [dissertation](../downloads/Dissertation_Yin_2022.pdf)
* Tim Clements, 2021, Harvard University, [dissertation](../downloads/Dissertation_Clements_2021.pdf)



Recent group Presentations to conferences 

* SSA 2024 **[Denolle et al, 2024: SCOPED Update](https://docs.google.com/presentation/d/1QL_yfaMfcH_zC1mIyAlHTM2ms2FX8yAN22WpA-l_suY/edit?usp=drive_link)**

* AGU 2023 **[Smoczyk et al., 2023, FingerPrinting the Cascades Volcanoes](https://docs.google.com/presentation/d/1UWQBOy0hZhkFYCCskUeb0OuJrS-wzp4K/edit?usp=sharing&ouid=114363206559877755268&rtpof=true&sd=true)**.

* AGU 2023 **[Denolle et al., 2023, SCOPED Update](https://docs.google.com/presentation/d/1FMR0QH62oBuadAWXQ7ENPMEj7cuv9mORD41QSpwOlDs/edit?usp=sharing)**.

* AGU 2023 **[Denolle et al., 2023, Cloud Seismology](https://docs.google.com/presentation/d/1FMR0QH62oBuadAWXQ7ENPMEj7cuv9mORD41QSpwOlDs/edit?uhttps://docs.google.com/presentation/d/1ekEv4T8Oanuv0EpwWBotoCTsu_N4cXc3iR9pp1TcBL0/edit?usp=sharing)**.

* SCEC 2023 **[Denolle et al., 2023, HPS CyberTraining](https://docs.google.com/presentation/d/1VXIdf3ocESIfkYW4MZHCzZ9mOdw-_eGYMFfE27CINJ0/edit?usp=sharing)**.



{% assign number_printed = 0 %}
{% for publi in site.data.publist %}

{% assign even_odd = number_printed | modulo: 2 %}
{% if publi.highlight == 1 %}

{% if even_odd == 0 %}
<div class="row">
{% endif %}

<div class="col-sm-6 clearfix">
 <div class="well">
  <pubtit>{{ publi.title }}</pubtit>
  <img src="{{ site.url }}{{ site.baseurl }}/images/pubpic/{{ publi.image }}" class="img-responsive" width="33%" style="float: left" />
  <p>{{ publi.description }}</p>
  <p><em>{{ publi.authors }}</em></p>
  <p><strong><a href="{{ publi.link.url }}">{{ publi.link.display }}</a></strong></p>
  <p class="text-danger"><strong> {{ publi.news1 }}</strong></p>
  <p> {{ publi.news2 }}</p>
 </div>
</div>

{% assign number_printed = number_printed | plus: 1 %}

{% if even_odd == 1 %}
</div>
{% endif %}

{% endif %}
{% endfor %}

{% assign even_odd = number_printed | modulo: 2 %}
{% if even_odd == 1 %}
</div>
{% endif %}

<p> &nbsp; </p>


## Full List of publications

For a full list of publications and links see [below](#full-list-of-publications) or go to [Google Scholar](https://scholar.google.com/citations?user=GR8BOxsAAAAJ&hl=en) for the most up-to-date list.

When iterating on a manucsript, group members have to self evaluate and improve with our [publication rubric](pub_rubric.md) and using chatGPT 4o+.

Students and postdoc in the lab are highlighted with (*)

---
{% for publi in site.data.publist %}

  {{ publi.title }} <br />
  <em>{{ publi.authors }} </em><br /><a href="{{ publi.link.url }}">{{ publi.link.display }}</a><br /><a href="{{ publi.link2.url }}">{{ publi.link2.display }}</a>

{% endfor %}
