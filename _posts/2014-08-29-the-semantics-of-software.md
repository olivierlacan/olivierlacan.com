---
layout: post
title: "The Semantics of Software"
date: 2014-08-30 12:15
location: "Val Morin, Québec, Canada"
categories: development
---
Jeremy Ashkenas shared some [counter-current thoughts about Semantic Versioning](https://gist.github.com/jashkenas/cbd2b088e20279ae2c8e) recently.

You should read his entire piece. It's very enlightening to hear the frustrations of a major open source project maintainer, there's always a lot to learn about how we could improve things.

## Unsemantic Versioning

Jeremy's gripes are quite valid. It is hard for maintainers to figure out how to communicate about possible breaking changes using merely a number. You want people to not be too afraid of upgrading otherwise you'd have to maintain very old version of your software for decades, yet you want them to be aware of what could break when they do upgrade. It's hard to get right, but I don't believe that makes Semantic Versioning entirely worthless. I wish we could learn to voice our concern about problems without threatening to move to another country.

Versioning and change-logging go hand in hand. Versions are much more machine-oriented, or at least they're much more superficial ways to communicate meaning. Change logs, however, offer essential context about versions so that — regardless of whether the maintainers of the project adhere to [Semantic Versioning](http://semver.org) or not — you (the open source software user) can know what they mean by `version 2.0.0`:

- Does it introduce a major API rewrite? Check the CHANGELOG.
- Does it reflect the introduction of a single (but important) breaking change in the `1.x` branch? Check the CHANGELOG.
- Does it mean that — despite the lack of a breaking change — a sufficient amount of new features were introduced to warrant opening a new "version chapter". Check the CHANGELOG.

Yes, semantic versioning numbers have low resolution. They can be ambiguous. They can be unclear. This why I believe it's so essential that maintainers make it a priority to a keep a thorough CHANGELOG. I don't think you can encode three dot-separated numbers with clearer meaning that actual human language.

## Numbers + Language

Over the past few months I've been working on guidelines to improve how we log changes in open source projects. I called it [keepachangelog.com](http://keepachangelog.com) because as it is too few projects (even popular ones) don't even have a change log.

I don't mean to pretend that I walked back from the mountain with truth-bearing tablets. I'm asking for [help and feedback](https://github.com/olivierlacan/keep-a-changelog/issues) from the community. That's because the best guidelines — as with science — are based on consensus.

I don't really want everyone to agree on what a change log's filename should be (it's CHANGELOG, deal with it). No, what I want is to gather the most common and sensible change-logging practices and try to get as many people to use them — reliably, consistently, predictably, boringly.

What I do want is for us to improve open source user experience. I'd like to bias the change log conventions towards sensible practices instead of popular or entrenched practices. Sayings like "we've always done it this way" and "everybody else does it that way" are noxious. I want to end the practice of periodically dumping git logs diffs into a file and calling that CHANGELOG. It's useless handwaving and it's an insult to users and contributors alike.

## Badly Breaking

Now, to get back to versioning, it sucks when [tons of things stop working because one library changes its API just enough to cause breakage](https://github.com/jashkenas/underscore/issues/1805). Yep, it's a great opportunity for us to have a much-needed conversation about how we communicate **about** our open source software. As mentioned on [The Changelog](http://5by5.tv/changelog/127), the idea that open source software is a gift to the world can be dangerous.

Publishing open source software is not virtuous in vacuum. There are many parts to a praise-worthy open source project :
- defined use cases
- installation steps
- usage examples
- sensible versioning
- bug reporting infrastructure
- contribution guidelines
- clear licensing
- thorough change log
- up-to-date documentation
- reasonable test suite

Notice how I haven't even mentioned the actual software? Ask any open source maintainer what they spend most time doing or worrying about? I'd be surprised if many said "the software itself".

The guidelines I've established on [keepachangelog.com](http://keepachangelog.com) are based on my experience as a developer. For the past two years I've been working on a now [nearly four-years old Rails application](https://codeschool.com). We have 76 direct production dependencies on the Ruby side alone. Yes, that is a lot. And those dependencies often have their own dependencies. While we try to spend most of time producing things of value for our customers, I've been doing my best to keep these dependencies up-to-date for security releases. But of course we've also had to fight [dependency rot][^1] or simply upgrade smaller dependencies whenever we've decided it was worthwhile for us to upgrade one of our [Alpha dependencies][^2].

This all means that I've been spending a **lot** of time upgrading things, fixing things that minor (or even patch) versions shouldn't have broken, searching in vain for CHANGELOGs. This has recently become an easier task thanks to [Gemnasium](http://gemnasium.com) but it's still very difficult, time consuming, and more importantly it's time I can spend producing software for our customers.

Should we not have this many dependencies? Sure. Yet, I'd rather take a chance on community-maintained libraries rather than betting that our small team (four people) can produce and maintain some software we have little expertise over (but need regardless). That feels like a much more safer bet, at least for now.

Let's all try to make our open source project more mindful of their end-users. For instance by offering better information (or [metadata](http://shields.io/)) about the projects themselves. I don't think I'd be the only grateful one around if we infused more meaning in our software.

## Resources
Here's a list of interesting projects I've gathered recently and which can help you as an open source contributor improve how your project documents and communicate about changes:

- [Semantic Versioning](http://semver.org)
- [Fear-Driven Versioning](https://github.com/jonathanong/ferver/)
- [Gemnasium](http://gemnasium.com/) and [Vandamme](https://github.com/tech-angels/vandamme) (the CHANGELOG parser they use)
- [GitHub Changelog Generator](https://github.com/piwik/github-changelog-generator)
- [gitchangelog](https://github.com/securactive/gitchangelog)
- [rf-changelog][https://github.com/rpflorence/rf-changelog)

If you are aware of more (or better) tools that can help maintainers and contributors produce higher quality change logs, please send me a note and I'll update this list.

[^1]: Dependency rot happens when you inevitably bet on the wrong horse and one of your dependencies ends up either unmaintained (and eventually incompatible with other evolving dependencies) or poorly maintained.

[^2]: Alpha dependencies being major things like Ruby, Rails, jQuery, PostgreSQL,  or even Sass.
