---
layout: page
perpage: 8
---
{{ content }}

{% assign sorted = site.insta | reverse %}
    {% for insta in sorted %}
    {% assign firstpost = page.paginatecount | minus:1 | times: layout.perpage | plus: 1 %}
    {% assign lastpost = firstpost | plus: layout.perpage %}
    {% if forloop.index >= firstpost and forloop.index < lastpost %}

  <h2>{{ insta.title }}</h2>
    {% if insta.yt %}
  <div class='embed-container'>
    <iframe width="560" height="315" src='https://www.youtube.com/embed/{{ insta.yt }}' allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
  </div>
  {% endif %}
  <p>{{ insta.content | markdownify }}</p>
  	{% endif %}

{% endfor %}

{% assign howmanypages = site.insta.size | plus: layout.perpage | minus: 1 | divided_by: layout.perpage %}

<div class="pagination">

{% for i in (1..howmanypages) %}

  {% if forloop.first == true %}
    {% if page.paginatecount == 1 %}
      <span class="active">1</span>
      {% else %}
      <a href="/more{{ page.paginatecount | minus: 1 }}/">« Newer</a>
      <a href="/more1">1</a>
    {% endif %}
  {% elsif forloop.last == true %}
    {% if page.paginatecount == howmanypages %}
      <span class="active">{{ howmanypages }}</span>
      {% else %}
      <a href="/more{{ howmanypages }}">{{ howmanypages }}</a>
      <a href="/more{{ page.paginatecount | plus: 1 }}">Older »</a>
    {% endif %}
  {% else %}
    {% if page.paginatecount == i %}
      <span class="active">{{ i }}</span>
      {% else %}
      <a href="/more{{ i }}">{{ i }}</a>
    {% endif %}
  {% endif %}

{% endfor %}
</div>