---
layout: guide
title: A homemade guide to the good things of Orlando.
---

Version 3.0 (2016)

<ul class="table-of-contents">
  {% assign categories = "Coffee Shops, Bakery Pastry Shops, Restaurants, Bars, Parks, Theaters" | split: ","  %}
  {% for category in categories %}
    {% assign category_anchor = category | downcase | split: ' ' | join: '-' %}
    {% assign venue_count = site.pages | where: "categories", category_anchor | size %}
    <li>
      <a href="#{{ category_anchor }}">
        {{ category }} ({{ venue_count }})
      </a>
    </li>
  {% endfor %}
</ul>

<ul class="venue-categories">
  {% assign categories = "Coffee Shops, Bakery Pastry Shops, Restaurants, Bars, Parks, Theaters" | split: ","  %}
  {% for category in categories %}
    {% assign category_handle = category | downcase | split: ' ' | join: '-' %}

    <a name="{{ category_handle }}"></a>
    <h3>{{ category }}</h3>
    {% assign venues = site.pages | where: "categories", category_handle %}

    {% for venue in venues %}
      <article class="venue">
        <h4>{{ venue.title }}</h4>
        {% if venue.images %}
          <div class="venue-images">
            {% for image in venue.images %}
              {% assign file = image | split: '|' | first %}
              {% assign alt = image | split: '|' | last %}
              <img src="{{ site.url }}/assets{{ venue.dir }}{{ file }}" alt="{{ alt }}">
            {% endfor %}
          </div>
        {% endif %}

        {{ venue.content | markdownify }}

        <aside>
          {% if venue.site %}
            <a href="{{ venue.site }}">Site</a>
          {% endif %}
          {% if venue.foursquare %}
            <a href="{{ venue.foursquare }}">Foursquare</a>
          {% endif %}
          {% if venue.yelp %}
            <a href="{{ venue.yelp }}">Yelp</a>
          {% endif %}
          {% if venue.instagram %}
            <a href="{{ venue.instagram }}">Instagram</a>
          {% endif %}
        </aside>
      </article>
    {% endfor %}

  {% endfor %}
</ul>

This guide is inspired by <a href="http://waxy.org/" title="Waxy">Andy Baio</a>'s
<a href="http://waxy.org/2011/09/geeks_guide_to_portland_2011/">Geek Guide to Portland</a>
which is basically amazing.
