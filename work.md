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
    <time>{{ work.date | date: '%B %Y' }} - {{ work.end | date: '%B %Y' | default: "Today" }}</time>
  </li>
  {% endfor %}
</ul>

### Volunteering

In 2020, I volunteered with the [COVID Tracking Project](https://covidtracking.com/) to
gather data about the COVID-19 outbreak in Florida and [developed tools][ovid] to help
track the outbreak in Florida and other U.S. states but also to [gather news reports][paperboi]
early on in the pandemic.

I co-wrote a [small white paper on Florida data issues][c19blog] with Rebecca Glassman and
talked about my experience as a programmer in RubyConf talk called [Tracking COVID-19 with Ruby][c19talk].

In the process I worked with many local Florida journalists to try and help them understand
the counter-intuitive complexities of

[c19blog]: https://covidtracking.com/analysis-updates/florida-covid-19-data
[c19talk]: /talks/tracking-covid-19-with-ruby/
[ovid]: https://github.com/olivierlacan/ovid
[paperboi]: https://github.com/olivierlacan/paperboi

### Open Source

#### Shields 

I started the [Shields metadata badge](http://shields.io) project that
you can now find in [open source repositories][gh-shields] all over. 
Shields badges are dynamically generated and display at-a-glance 
information about a project. For example whether tests are passing or 
failing, if dependencies are out of date, or how what percentage of the 
source code is documented.

Shields is now maintained without my involvment and has been wildly 
successful, [reaching millions of users][gh-shields].

[gh-shields]: https://github.com/search?q=%22img.shields.io%2Fbadge%22&type=code

#### Keep a Changelog

I created and maintain [Keep a Changelog](http://keepachangelog.com) to 
give fellow software developers clearer guidelines on how to provide
human-friendly release notes for their software.

Keep a Changelog is used by [over 50,000 projects on GitHub alone][kac].

[kac]: https://github.com/search?q=%22format+is+based+on+%5BKeep+a+Changelog%5D%28https%3A%2F%2Fkeepachangelog.com%2Fen%22&type=code&ref=advsearch

#### Ruby on Rails

As a regular contributor, I've made small but impactful improvements 
to Rails [database logging][vql], [error feedback mechanisms], and 
[implicit model linking logic][ltm].

[errors]: https://github.com/rails/rails/pull/46342
[ltm]: https://github.com/rails/rails/pull/42234
[vql]: https://github.com/rails/rails/pull/26815
