---
layout: page
permalink: /insta
title: Instagram elaborations
---

If you're here because you followed the link in my bio, this is what you're looking for (newest to oldest).

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