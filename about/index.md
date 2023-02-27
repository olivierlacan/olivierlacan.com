---
layout: page
title: About me
---

{% assign startWebsites = 2000 %}
{% assign startProgramming = 2010 %}
{% assign nowYear = 'now' | date: '%Y' %}
{% assign websitesYears = nowYear | minus: startWebsites %}
{% assign programmingYears = nowYear | minus: startProgramming %}
{% assign avatar = "https://en.gravatar.com/userimage/4041830/23a43fd150e4f6d6b16a5781bc2532ca.jpg" %}
{% assign currentTitle = "Principal Software Engineer" %}

<figure id="mug">
  <a href="{{ avatar }}?size=1760" title="Download large version of this portrait photo">
    <img src ="{{ avatar }}?size=300" alt="Portrait of Olivier Lacan"/>
  </a>
  <figcaption>Yep, that's me. &#10548;</figcaption>
</figure>

I've been creating websites for over {{ websitesYears }} years
and I've evolved into a more backend focused software developer during
the last {{ programmingYears }} years. Despite my unescapable
Frenchness (Paris-born & raised), my favorite languages are English and
[Ruby](http://tryruby.org).

I spend most of my time building and maintaining
large and small web applications as a {{ currentTitle }}.

### Work

I've built and maintained [Code School][cs] between 2012 and 2018.
Code School was acquired by [Pluralsight][ps] in 2015 and I led a large
migration of Code School customers to Pluralsight in 2018.

I've written and developed several interactive 
[Code School courses][csc]. I authored a high-level 
Ruby on Rails course for Pluralsight called 
[Ruby on Rails: The Big Picture][rorbp].

I've also worked on bringing interactive hands-on content at Pluralsight with 
[Projects](/work#projects): a task-focused way to learn how to bridge 
the gap between theoretical technology knowledge and practical usage.

[cs]: /work/code-school/
[ps]: https://pluralsight.com
[pj]: /work/pluralsight/#projects
[csc]: /work/code-school/
[rorbp]: /work/ruby-on-rails-the-big-picture

At Pluralsight, I worked as a tech lead on a team which developed a new multi-content-type
infrastructure in conjunction with our Authorization and Product Catalog teams to migrate
our system from only being able to handle one content type (video courses) to multiple content
types (labs, projects, guides, etc).

### Public Speaking

I've spoken at multiple conferences around the world on topics like
Science-driven Development, contributing to open source, Ruby on Rails,
and information security. You can find my published talks [here](/talks).

In the past, I co-hosted the Ruby5 podcast for several years, created 
and hosted Ruby Facets and appeared as a guest and panelist in several 
podcasts.

## Get in touch

If you'd like to email me securely you can use my [PGP Key][pgp] (see
[GPGTools][gpg]) but email and twitter are fine for most cases.

[gpg]: /tools/security/gpgtools
[pgp]: http://hkps.pool.sks-keyservers.net/pks/lookup?search=hi%40olivierlacan.com&fingerprint=on&op=index
