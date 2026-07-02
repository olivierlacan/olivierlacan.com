---
layout: page
title: Work
---

<p>
  My career so far has centered on technology education. I've used
  my time and resources to contribute to open source and to volunteer on 
  projects focusing more on the environment and public health.
</p>

<p>
  These days I'm most interested in climate solutions and 
  electrification efforts to limit anthropogenic planetary warming to
  1.5 degrees celsius in my lifetime.
</p>

<ul class="talks">
  {% for work in site.work reversed %}
  <li>
    <a href="{{ work.url }}">{{ work.title }}</a>
    <time datetime="{{ work.date | date: '%Y-%m' }}">{{ work.date | date: '%B %Y' }}</time> - {% if work.end %}<time datetime="{{ work.end | date: '%Y-%m' }}">{{ work.end | date: '%B %Y' }}</time>{% else %}Today{% endif %}
  </li>
  {% endfor %}
</ul>

### Volunteering

#### COVID Tracking Project

Starting in March 2020, I was one of the many volunteers behind the
[COVID Tracking Project](https://covidtracking.com/), where I focused on
gathering and interpreting the COVID-19 data published by the Florida
Department of Health.

To support the project's data entry work, I built [ovid][ovid], a small
web tool that turned the raw JSON feeds behind state health department
dashboards — Florida's in particular — into the high-level aggregate
counts volunteers recorded, rather than relying on error-prone
screen-scraping. I also built [paperboi][paperboi], which collected
recent COVID-19 news reports organized by U.S. state or territory, to
help keep up with fast-moving local reporting early in the pandemic.

In July 2020, I co-wrote [Florida's COVID-19 Data: What We Know, What's
Wrong, and What's Missing][c19blog] with public health researcher
Rebecca Glassman, documenting gaps in Florida's public reporting — most
notably the state's failure at the time to publish how many people were
currently hospitalized with COVID-19.

Along the way I spoke with several Florida journalists to help them
understand the complexities of the state's data, including an
[interview with FOX 35 Orlando][fox35] about missing hospitalization
data and the trust that comes from transparent public reporting. I later
shared what I learned as a programmer in a RubyConf 2020 talk,
[Tracking COVID-19 with Ruby][c19talk].

[c19blog]: https://covidtracking.com/analysis-updates/florida-covid-19-data
[c19talk]: /talks/tracking-covid-19-with-ruby/
[ovid]: https://github.com/olivierlacan/ovid
[paperboi]: https://github.com/olivierlacan/paperboi
[fox35]: https://www.fox35orlando.com/news/covid-tracking-project-a-lot-of-florida-covid-19-data-is-still-missing

### Open Source

#### Shields 

I started the [Shields metadata badge](http://shields.io) project that
you can now find in [open source repositories][gh-shields] all over. 
Shields badges are dynamically generated and display at-a-glance 
information about a project. For example whether tests are passing or 
failing, if dependencies are out of date, or what percentage of the 
source code is documented.

Shields is now maintained without my involvement and has been wildly 
successful: it [serves over 1.6 billion badge images per month][shields-repo] 
and is used by [millions of open source projects][gh-shields].

[shields-repo]: https://github.com/badges/shields

[gh-shields]: https://github.com/search?q=%22img.shields.io%2Fbadge%22&type=code

#### Keep a Changelog

I created and maintain [Keep a Changelog](http://keepachangelog.com) to 
give fellow software developers clearer guidelines on how to provide
human-friendly release notes for their software.

Keep a Changelog is used by [over 50,000 projects on GitHub alone][kac].

[kac]: https://github.com/search?q=%22format+is+based+on+%5BKeep+a+Changelog%5D%28https%3A%2F%2Fkeepachangelog.com%2Fen%22&type=code&ref=advsearch

#### Ruby

I [proposed a new system][hash] to check whether Ruby hashes (dictionaries or 
hash maps) contain other hashes or subsets of those hashes. 

This [official proposal][rop] was eventually converted as a new set of 
comparison operators (`Hash#<=`, `Hash#<`, `Hash#>=`, `Hash#>`) in [Ruby 2.3][ruby2-3].

[hash]: https://olivierlacan.com/posts/proposal-for-a-better-ruby-hash-include/
[rop]: https://bugs.ruby-lang.org/issues/10984
[ruby2-3]: https://github.com/ruby/ruby/blob/v2_3_0/NEWS


#### Ruby on Rails

As a regular contributor, I've made small but impactful improvements 
to Rails [database logging][vql], [error feedback mechanisms][errors], and 
[implicit model linking logic][ltm].

[errors]: https://github.com/rails/rails/pull/46342
[ltm]: https://github.com/rails/rails/pull/42234
[vql]: https://github.com/rails/rails/pull/26815
