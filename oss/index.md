---
layout: guide
title: Open Source Software
---
### Ruby

#### Hash Comparison Operators (Ruby 2.3)
I contributed to the improvement of the interface for the [`Hash`][1]
core Ruby class. This resulted in the creation of new methods to compare
Ruby hash instances with one another. These new classes were [released
in Ruby 2.3 on December 25th, 2015][5] and are also also available in more
recent versions of Ruby.

In [Proposal for a better Ruby Hash#include?][2] I made the case for
this potential improvement. I later submitted a [proper feature request][3]
after gathering feedback from fellow Ruby programmers on the idea.

After lengthy discussions and consideration from the Ruby Core Team
which overseas the development of CRuby (the reference implementation of
Ruby in the C programming language) the Hash Comparison Operators were
[merged into Ruby's trunk on November 20th, 2015][4].

[1]: https://docs.ruby-lang.org/en/2.5.0/Hash.html
[2]: /posts/proposal-for-a-better-ruby-hash-include/
[3]: https://bugs.ruby-lang.org/issues/10984
[4]: https://github.com/ruby/ruby/commit/d68c3ecf98bf3b5802a6b0f9a6bcf7825addd9e5
[5]: https://www.ruby-lang.org/en/news/2015/12/25/ruby-2-3-0-released/

#### Improved Error Handling of Keyword Arguments (Ruby 2.5)

As demonstrated in [Better Feedback on Ruby 2.2 Keyword Argument Errors][6]
the handling of argument errors involving keyword arguments used to be
inadequate and confusing. I [proposed an improvement][7] to the the
Ruby Core Team and implemented a fix which was [applied to Ruby's trunk on
July 4th, 2017][9] and eventually [released in Ruby 2.5][8] on December 25th, 2017.

[6]: /posts/better-feedback-on-ruby-2-2-keyword-argument-errors/
[7]: https://bugs.ruby-lang.org/issues/13196
[8]: https://www.ruby-lang.org/en/news/2017/12/25/ruby-2-5-0-released/
[9]: https://bugs.ruby-lang.org/projects/ruby-trunk/repository/revisions/59259

### Rails

#### Verbose Query Logging (Rails 5.2)

In order to allow Rails developers to identify the source of specific SQL
queries logged in the Rails console I [contributed][10] a new configuration option
enabled by default in the Rails development environment that displays the
source code file and line that triggered each specific SQL query.

This contribution was accepted and merged into Rails' master branch and will
be part of the stable release of Rails 5.2. Meanwhile it's available as in
[Rails 5.2 RC1][11] which was released on January 30th, 2018.

[10]: https://github.com/rails/rails/pull/26815
[11]: http://weblog.rubyonrails.org/2018/1/30/Rails-5-2-RC1-Active-Storage-Redis-Cache-Store-HTTP2-Early-Hints-Credentials/


### Personal Projects

#### [Shields](https://github.com/badges/shields)
I created [Shields](http://shields.io) in January 2013 in a bout of
constructive rage against bad open source repository metadata badges.
I'm a bit amazed by how shiny that rage diamond turned out to be.

Thanks to the amazing work of the community (I had very little to do
with it), we now have an [awesome API](http://shields.io/) that can
[generate Retina-grade SVG badges on the fly][12]).

[12]: http://img.shields.io/badge/how%20cool-is%20that%3F-yellowgreen.svg

#### [Keep a Changelog](http://keepachangelog.com)

One fatelul day in May 2014 I decided I'd had enough trying to decipher
the Git commits from one of my application's dependencies. The
dependency in question wasn't some obscure repository. It was something
likely used by thousands of people, and yet it didn't have a proper
CHANGELOG to speak off. Instead the maintainers did a git log diff
between two version tags and dropped that into something they called a
"CHANGELOG".

That wasn't a CHANGELOG. A CHANGELOG is a thing for humans who already
know how to make a git log diff if they need to. But they don't want to
because git log diff are utterly useless to understand what has changed
in a release at a high level. This frustration led me to write down what
I believe are guidelines for a human-friendly CHANGELOG.

#### [Orientation](http://orientation.io)

In late 2012, after nearly a year of working at Code School, I noticed
that while our team was growing, certain questions kept being asked to
the same people over and over again. Being an early member of the team,
I had to repeatedly explain simple things that weren't necessarily
related to code, but often spun out to include company traditions,
vacation policies, our customer support philosophy, etc.

Orientation was born out of the desire to concentrate as much knowledge
as possible in a single point of entry that did not create interruptions
for our small team, allowing us to remain as focus as possible;
collaborating when it's necessary and not to answer a single question.
The idea was that people would go to Orientation first — the same way
web developers tend to go to Stack Overflow — before giving up and
asking for help. Better, I wanted to make the act of documenting
something easy enough for anyone to participate in: if you have a
question not answered by Orientation, simply create a new article with
that question as the title and send the URL to the team or the person
you believe holds your answer. Instead of answering one person at a
time, this allows knowledge holders to release that knowledge from the
sillo of their brain. It's better for them because they'll be less
interrupted, and it's better for the team because knowledge is not
concentrated in single individuals who may have a meeting, go on
vacation, or leave the company with that knowledge still stored in their
head.

It took me three years to finally open-source Orientation and I'm
incredibly glad I did because the influx of excitement and participation
has allowed some great feature like article subscription to be added. It
allows every single person who relies on a piece of information to be
notified when an article is updated, creating hyperlinks of sort between
mostly static information and the people who depend on it.
