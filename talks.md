---
layout: page
title: Talks
---

<p>
  One of my favorite ways to share knowledge with the Ruby and greater
  open source community is to speak at conferences whenever I can. You 
  can find a list of all my published talks below with slides and video 
  recordings when available.
</p>

<ul class="talks">
  {% for talk in site.talks reversed %}
  <li>
    <a href="{{ talk.url }}">{{ talk.title }}</a> - {{ talk.venue }}
     <time>{{ talk.date | date_to_string }}</time>
  </li>
  {% endfor %}
</ul>