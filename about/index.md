---
layout: page
title: About me
---

{% assign startWebsites = 2000 %}
{% assign startProgramming = 2010 %}
{% assign nowYear = 'now' | date: '%Y' %}
{% assign websitesYears = nowYear | minus: startWebsites %}
{% assign programmingYears = nowYear | minus: startProgramming %}

I've been creating websites for over {{ websitesYears }} years
and I've evolved into a more backend focused software developer during
the last {{ programmingYears }} years. Despite my unescapable
Frenchness, my favorite languages are English and
[Ruby](http://tryruby.org).

I spend most of my time building and maintaining
large and small web applications.

<figure id="mug">
  <a href="https://en.gravatar.com/userimage/4041830/f96aa6256f6953179d7921d981516f2b?size=2048" title="Download a huge version of my face to see if you can figure out the number of degrees I tilted it for this shot.">
    <img src ="https://en.gravatar.com/userimage/4041830/f96aa6256f6953179d7921d981516f2b.jpg?size=540" alt="Portrait of Olivier Lacan"/>
  </a>
  <figcaption>That's me. &#10548;</figcaption>
</figure>

### Work

I've built and maintained [Code School](https://www.codeschool.com) between 2012 and 2018.
Code School was acquired by [Pluralsight](https://pluralsight.com) in 2015 and I led a large
migration of Code School customers to Pluralsight in 2018.

I've written and developed several interactive [Code School courses](/work#code-school). Recently, I
authored a high-level Ruby on Rails course for Pluralsight.

I've worked on bringing interactive hands-on content at Pluralsight with [Projects](/work#projects):
a task-focused way to learn how to bridge the gap between theoretical technology knowledge and practical usage.

At Pluralsight, I worked as a tech lead on a team which developed a new multi-content-type
infrastructure in conjunction with our Authorization and Product Catalog teams to migrate
our system from only being able to handle one content type (video courses) to multiple content
types (labs, projects, guides, etc).

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

I've created the Shields metadata [badges](http://shields.io) that
you can now find in [open source repositories][gh-shields] all over to
succinctly display whether tests are passing or failing, if dependencies
are out of date, or if code is well-documented or not.

[gh-shields]: https://github.com/search?utf8=✓&q=https%3A%2F%2Fimg.shields.io%2F&type=Code

I wrote [Keep a Changelog](http://keepachangelog.com) to give fellow
software developers clearer guidelines on how to provide
human-friendly release notes for their software.

### Public Speaking

I've spoken at multiple conferences around the world on topics like
Science-driven Development, contributing to open source, Ruby on Rails,
and information security. You can find my published talks [here](/talks).

I also used to co-host the Ruby5 podcast and [other podcasts](/work#podcasts).

## Get in touch

If you'd like to email me securely you can use my [PGP Key][pgp] (see
[GPGTools][gpg]). [Keybase.io][kb] is a neat alternative with a much
easier learning curve although it may not be as secure.

[gpg]: /tools/security/gpgtools
[kb]: https://keybase.io/olivierlacan
[pgp]: http://hkps.pool.sks-keyservers.net/pks/lookup?search=hi%40olivierlacan.com&fingerprint=on&op=index
