---
layout: post
title: "Logging Changes All Over The World"
date: 2016-08-07 12:22
location: "Orlando, Florida"
categories:
  - open source software
  - development
---

After months of slow but steady work, [keepachangelog.com][kac] is now officially
versioned and translated in **nine** languages!

Prior to this, we have of course been using an [internal changelog][cl] to
document minor version evolutions but so far this wasn't properly reflected on
the website.

I've been impressed with how popular this rant-turned-project[^1]
has been. It looks like many more people than I've ever expected are finding it
useful in communities much broader than open source software.

![Illustration of Keep a CHANGELOG popularity with a graph of traffic over the past three years]({{ site.url }}/assets/keep-a-changelog-popularity.png)

Now that the latest version (0.3.0) is public, it will be much easier to
coordinate the translations that have been streaming in steadily over the
past year.

If you know anyone who could help translate the project in a
new language, please point them to the [Translations section in the project
README][tr] for details on how to contribute.

I'm grateful to all the contributors to this project[^2] but in particular to
the following folks for submitting pull requests with translations:

- [Tianshuo][tianshuo] for the Chinese translation(s)
- [Michael Burri][mpbzh] for German
- [Magnus Österlund][magol] for Swedish
- [Emre Erkan][karalamalar] for Turkish
- [Alexandr Borisov][aishek] for Russian
- [Talles L][tallesl] for Brazilian Portugese
- [Omar del Real][ZeliosAriex] for Spanish

## Why Keep a CHANGELOG?

The mission of Keep a CHANGELOG is to help software developers understand the
value of purposeful version documentation.

Anyone can try to read a commit log between the software version they're using
and a new one they would like to update to. Few people can understand the meaning
of each individual commit, assuming project contributors know
[how to write good commit messages][committips]. Even fewer people can
understand what commit is going to break their software because you didn't
bother to properly document the changes in yours.

**Open source software is certainly valuable, but without proper documentation you
might as well keep it closed. Show that you care about the people you share
your software with, [keep a changelog][kac].**

[kac]: http://keepachangelog.com
[cl]: https://github.com/olivierlacan/keep-a-changelog/blob/c844dcacdcce8d026f0867b7782866d6d5b11492/CHANGELOG.md
[tr]: https://github.com/olivierlacan/keep-a-changelog#translations
[ossragediamond]: http://olivierlacan.com/posts/an-open-source-rage-diamond/
[rd]: http://railsdiff.org/
[tianshuo]: https://github.com/tianshuo
[mpbzh]: https://github.com/mpbzh
[magol]: https://github.com/magol
[karalamalar]: https://github.com/karalamalar
[aishek]: https://github.com/aishek
[tallesl]: https://github.com/tallesl
[ZeliosAriex]: https://github.com/ZeliosAriex
[envy]: http://madewithenvy.com/
[nate]: https://github.com/nbibler
[jacob]: https://github.com/jswanner
[committips]: https://robots.thoughtbot.com/5-useful-tips-for-a-better-commit-message

[^1]: Not my first [rage diamond][ossragediamond].
[^2]: Including [Jacob Swanner][jacob] (from [Envy][envy] and the wonderful [RailsDiff][rd]) who was my rubber duck while going through the final changes last Friday so I could finally release this. Speaking of Envy, I drew tons of inspiration and advice from [Nate Bibler][nate]'s beautiful changelogs throughout the past five years, and he's provided great advice and feedback, so he gets an awkwardly long hug as well.
