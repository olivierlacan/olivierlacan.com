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

I've been building web sites and applications for over {{ websitesYears }} years. 
Over the past {{ programmingYears }} years, I've evolved into a 
backend-focused software engineer. I care deeply about creating 
sustainable software: in the way it's designed and built, but crucially 
in the possibilities the software itself enables. I build software for 
people, most crucially for people who seek to improve our 
anthropogenically-endangered ecosystem and address climate change today, 
not tomorrow.  

Despite my unescapable
Frenchness (Paris-born & raised), my favorite languages are English and
[Ruby](https://try.ruby-lang.org).

I spend most of my time building and maintaining
large and small web applications as a {{ currentTitle }}.

### Work

I was an early member of the platform team that built and maintained 
[Code School][cs] between 2012 and 2018. I Code School's migration into 
[Pluralsight][ps] in 2018 after it was acquired. Since then, I've developed 
new [hands-on learning experiences][pj] (for learners & authors) at 
Pluralsight, overhauled its [content pipeline to make it support 
unlimited content types][cl], and worked on next-generation multi-modal 
immersive technology education.

As a technology educator, I've written and developed several interactive 
[Code School courses][csc]. Most notably, I authored a free 
[Try Git course][trygit] in collaboration with GitHub to teach the basics 
of git in 15 minutes. Recently I released a high-level Ruby on Rails 
course on Pluralsight called [Ruby on Rails: The Big Picture][rorbp].

[cs]: /work/code-school/
[ps]: https://pluralsight.com
[pj]: /work/pluralsight/#projects
[csc]: /work/code-school/
[rorbp]: /work/ruby-on-rails-the-big-picture
[cl]: /work/pluralsight/#content-libraries

You can find [more about my work here](/work).

### Open Source

I've contributed to both the Ruby programming language and the Ruby 
on Rails web development framework.

I also created the Shields metadata badge project which is used by 
countless open source projects around the world.

In order to provide better guidance to software maintainers on how to 
communicate about releases, I wrote a set of helpful guidelines and 
examples in [Keep a Changelog][kac] which has been translated in over 
26 languages by contributors since it was first released in 2015. 

[kac]: https://keepachangelog.com/

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
