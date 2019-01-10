---
layout: page
permalink: /insta
title: Instagram links
---

You probably came here from Instagram because I said "link in bio for more info" or something like that. Here it all is in chronological order.

{% assign sorted = site.insta | reverse %}
    {% for insta in sorted %}
  <h2>{{ insta.title }}</h2>
  {% if insta.yt %}
  <div class='embed-container'>
  	<iframe width="560" height="315" src='https://www.youtube.com/embed/{{ insta.yt }}' allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
  </div>
  {% endif %}
  <p>{{ insta.content | markdownify }}</p>
{% endfor %}