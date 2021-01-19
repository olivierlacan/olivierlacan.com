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

I've built and maintained [Code School](https://www.codeschool.com) between 2012 and 2018.
Code School was acquired by [Pluralsight](https://pluralsight.com) in 2015 and I led a large
billing migration of paid Code School customers to Pluralsight in 2018.

I've written and participated in the development of
several of our earliest Code School courses. More on that [here](/work). More recently I
authored a high-level Ruby on Rails: The Big Picture course which goes over the basics
of the web development framework in less than an hour.

I've worked on bringing interactive hands-on content at Pluralsight with Projects after
contributing to its initial implementation at Code School back in 2017.
Projects was inspired by [Katrina Owen](https://www.kytrinyx.com/)'s excellent
[exercism](https://exercism.io/) and is a step-by-step task-focused way to learn how to
bridge the gap between theoretical knowledge of a technology and its practical use.
Projects allows learners to work with code repositories or direct file uploads and commit changes
incrementally as they work to satisfy increasingly complex code requirements.

At Pluralsight, I worked as a tech lead on a team which developed a new multi-content-type
infrastructure in conjunction with our Authorization and Product Catalog teams to migrate
our system from only being able to handle one content type (video courses) to multiple content
types (labs, projects, guides, etc).

I've created the Shields metadata [badges](http://shields.io) that
you can now find in [open source repositories][gh-shields] all over to
succinctly display whether tests are passing or failing, if dependencies
are out of date, or if code is well-documented or not.

[gh-shields]: https://github.com/search?utf8=✓&q=https%3A%2F%2Fimg.shields.io%2F&type=Code

I wrote [Keep a Changelog](http://keepachangelog.com) to give fellow
software developers clearer guidelines on how to provide
human-friendly release notes for their software.

I've spoken at multiple conferences around the world on topics like
Science-driven Development, contributing to open source, Ruby on Rails,
and information security. You can find my published talks [here](/talks).

## Get in touch

If you'd like to email me securely you can use my [PGP Key][pgp] (see
[GPGTools][gpg]). [Keybase.io][kb] is a neat alternative with a much
easier learning curve although it may not be as secure.

[gpg]: /tools/security/gpgtools
[kb]: https://keybase.io/olivierlacan
[pgp]: http://hkps.pool.sks-keyservers.net/pks/lookup?search=hi%40olivierlacan.com&fingerprint=on&op=index
