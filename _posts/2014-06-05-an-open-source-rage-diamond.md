---
layout: post
title: "An Open Source Rage Diamond"
date: 2014-06-05 6:14
categories: development
---
One [late night of January 2013](https://github.com/badges/shields/commit/a99b4db912b8ccd2350c417db301eea99ef4996a),
I had a little bout of anger. The culprit: these badges I was starting to
notice all over the place on open source project README files.
The idea behind the badges was great: provide useful metadata regarding
how well tested the project is, whether those tests are passing or not,
how well factored the codebase is, etc. Yet, most of these badges seemed
were lazy clones of each other. Worse, it seemed like each new copy turned
out uglier. Somehow, the people making these badges had managed to achieve
"perfect" visual inconstency. It didn't seem to shock anyone. Perhaps,
maintainers didn't care or couldn't tell the difference.

![How open source badges looked before Shields](/images/pre-shields_inconsistency.png)

Some of these badges weren't helpful at all. They looked a lot like
stealth advertising for the third-party services powering them.
Instead, they could have been focusing on providing actual value first,
and profit from people clicking on the badges to discover what was
providing this useful info.

Basically, the badges were often neither functionally optimal nor
aesthetically pleasing. I saw a missed opportunity there. So, despite my
rusty design skills, I hopped into Photoshop. Some time later I emerged
with a [rage diamond](https://github.com/badges/shields/commit/0a6bc1ab5be03d6369799303ac6c1db3c8c50bb4).
It was a simple Photoshop file with a badge template that I
took the time to design properly: consistent padding, a more
legible typeface despite a similar font size, better contrast, softer
colors, a more subtle gradient, etc.

![The Original Shields Design](/images/shields_original.png)

I called the project Shields as a nod to one of the greatest TV
shows of all time — [The Shield](http://en.wikipedia.org/wiki/The_Shield)
— and because in the US, a police officer's badge is sometimes referred to as
their "shield".

Over time the design for the badge evolved. It became good enough that people
started paying attention to my little project. The maintainers of [Travis CI](http://travis-ci.org),
[Gemfury](https://gemfury.com/), [Code Climate](http://codeclimate.com),
[Coveralls](https://coveralls.io/), [Gittip](https://www.gittip.com/),
[Gemnasium](https://gemnasium.com/), and more became involved.
Many of these vendors asked us to design a badge for their service, or for help
integrating the design into their service by generating PNG files for them.

After some much needed help from [Nicholas Acker](https://github.com/ackerdev)
with an [SVG](http://en.wikipedia.org/wiki/Scalable_Vector_Graphics) template,
we started toying with the idea of an API that
would generate badges on the fly based on a key, a value, and a color.
It seemed obvious because people were already implementing their own
internal APIs to generate them for their service, why not provide a
centralized one and never have to crank out PNGs and SVGs by hand?

One issue that caught us by surprise was how poorly the badges (being
PNG [bitmaps](http://en.wikipedia.org/wiki/Bitmap) looked on high density
(or "Retina") displays because none of us had a swanky Retina MacBook Pro
at the time. Thankfully
[Kyle Neath](https://twitter.com/kneath/status/300327792879476738) from
GitHub chimed in and we quickly came up with
[a temporary yet satisfying solution](https://github.com/badges/shields/issues/12#issuecomment-13397282).

Thankfully the API idea meshed quite well with the resolution issue
because SVG images scale to any resolution and they adapt to the
pixel density of the screen. Through a slightly tortuous path that took
much longer than we anticipated, less than a year after my original
rage diamond people in and around the
[Shields community](https://github.com/badges/shields) converged and
[shields.io](http://shields.io/) was launched thanks to the help of many
contributors including [Thaddee Tyl](https://github.com/espadrine),
[Mathias Bynens](https://github.com/mathiasbynens),
[Chad Whitacre](https://github.com/whit537),
[Nathan Youngman](https://github.com/nathany) and many more.

This API has yet to be as widely adopted as the original PNG Shields badges
have been across much of the open source community, but I consider this
second major phase of the project a great success. Adoption of the API is
slowed by the fact that many of the services (Travis CI, Code Climate, etc.)
for which we originally produced badges have since created and hosted their
own versions. They obviously couldn't wait for us to release this API.
Now, many of them understandably don't want to depend on a third-party API to provide a
badge feature to their users, which is understandable.

Until all these services get around to updating their websites and
internal badge generation services, we will see inconsistencies because
the new SVG badges don't look exactly the same as the first generation.

![Illustration of the inconsistency between PNG and SVG Shields badges](/images/shields_inconsistency.png)

I've wanted to avoid this since inconsistency is what led to this rage
diamond in the first place, but it's alright. In the end my goal with this
project was surpassed by a few lightyears. I'm still amazed when I visit
the repos of [some](https://github.com/rails/rails#code-status)
[of](https://github.com/vmg/redcarpet) [my](https://github.com/plataformatec/devise)
[favorite](https://github.com/intridea/omniauth) [open](https://github.com/pry/pry)
[source](https://github.com/rack/rack) [projects](https://github.com/jekyll/jekyll#jekyll) and discover that
little badge design I put together in Photoshop a year ago.

Shields is also the most successful open source project I've ever been
involved with in a major way, and for a while it didn't contain a single
line of code. I think design-savvy developers and designers have a lot to
contribute to the open source world, and Shields is my proof.

Although the initial impulse for this project was frustration, I think my fellow
contributors and I have had a non-negligible impact on the open source
community. I've spent hours talking back and forth with people involved
with the services that fuel the data displayed on the badges. Through
these conversations, I've convinced nearly all of them to focus on
semantic clarity (how the badges are named and the data expressed) and
the value they provide to end-users (the people who use and contribute
to open source projects).

Even though they break the visual guidelines I had originally
established, I couldn't be more proud of seeing new takes on Shields-style
badges like [Inch Pages](http://inch-pages.github.io/). These folks took the
concept and tweaked it in order to display far more dense data than I
ever thought possible.

In the end, when I find projects READMEs like the
[Twitter Gem's](https://github.com/sferik/twitter), I'm really
happy because there is now so much more valuable metadata available at a
glance for someone who's just discovering the project, or even someone
who's coming back to it.

[Shields.io](http://shields.io) allows open source projects like
this to be more transparent and approachable. It also makes it easier to
tell what their maintainers care about, by showcasing:

|  |  |
| --- | --- |
| dependencies | [![Dependency status badge](/images/shields_dependencies.svg)](http://img.shields.io/gemnasium/badges/shields.svg) |
| code quality | [![code quality badge](/images/shields_code_quality.svg)](http://img.shields.io/codeclimate/github/rails/rails.svg) |
| test coverage | [![test coverage badge](/images/shields_test_coverage.svg)](http://img.shields.io/codeclimate/coverage/github/triAGENS/ashikawa-core.svg) |
| donations | [![donations badge](/images/shields_donations.svg)](http://img.shields.io/gittip/Shields.svg) |
| build status | [![build status badge](/images/shields_build_status.svg)](http://img.shields.io/travis/badges/shields.svg) |
| version awareness | [![version awareness badge](/images/shields_version_awareness.svg)](http://img.shields.io/gem/v/rails.svg) |
| licensing | [![licensing badge](/images/shields_licensing.svg)](http://img.shields.io/packagist/l/doctrine/orm.svg) |
