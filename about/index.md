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
[large](https://codeschool.com) and small Rails applications.

<figure id="mug">
  <a href="https://en.gravatar.com/userimage/4041830/f96aa6256f6953179d7921d981516f2b?size=2048" title="Download a huge version of my face to see if you can figure out the number of degrees I tilted it for this shot.">
    <img src ="https://en.gravatar.com/userimage/4041830/f96aa6256f6953179d7921d981516f2b.jpg?size=540" alt="Portrait of Olivier Lacan"/>
  </a>
  <figcaption>That's me. &#10548;</figcaption>
</figure>

I've built and maintained [Code School](https://www.codeschool.com) for
multiple years. I've written and participated in the development of
several of our earliest courses. More on that [here](/work).

I've created the Shields metadata [badges](http://shields.io) that
you can now find in [open source repositories][gh-shields] all over to
succinctly display whether tests are passing or failing, if dependencies
are out of date, or if code is well-documented or not.

[gh-shields]: https://github.com/search?utf8=✓&q=https%3A%2F%2Fimg.shields.io%2F&type=Code

I wrote [Keep a Changelog](http://keepachangelog.com) to give fellow
software developers clearer guidelines on how to providing
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
[pgp]: http://hkps.pool.sks-keyservers.net/pks/ookup?search=hi%40olivierlacan.com&fingerprint=on&op=index
