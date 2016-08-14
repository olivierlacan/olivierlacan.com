---
layout: post
title: "The Upgrade Trails"
date: 2016-08-13 11:01
location: "Val Morin, Québec, Canada"
categories: development
---

Recently I completed a Rails 4 upgrade for [codeschool.com][cs] which I 
originally started in the fall of 2014. Almost two years to upgrade from 
Rails 3.2 to Rails 4.2.

![You think it only took these four pull requests I'm showing in this screenshot to upgrade to Rails 3.2 back in 2014? Ha... haaa hahahahaha. Oh boy. If only.][32prscreenshot]

## Rationalizations

What took us so long? Why didn't we do it faster? Are we just really bad at 
upgrading things? Do we not care about security? Is it because Rails can't 
scale? Or maybe Rails 4 is bad? 

No. It was just hard. Because I did it wrong. Because I did it mostly alone.
Because I tried to do it too fast, and too slow, and everything in between. 
Because when a startup like Code School is born people take a lot of shortcuts.
They (and I) wrote a lot of terrible code, used a lot of terrible dependencies, 
hacked together a lot of terrible patches. 

Eventually, if those terrible things don't surface in bugs or build failures, 
you end up paying the price for them on the upgrade trails. The circuitous, 
slippery, and depressing paths that you can barely see when you're riding 
high on the shiny new Rails. 

I didn't spend most of those two years working on these upgrades, of course. 
Deplore it if you will, framework upgrades are not always a business priority. 
In my mind they should be because updating often means avoiding getting the 
short end of the stick with bug fixes. *Most* important bug fixes are 
backported to earlier minor versions of frameworks like Rails — *some* slip 
through the cracks.

Over time, the body of knowledge surrounding the software your business depends 
on the most grows stale. People drop support for the version you use in their 
test builds. Gems stop trying to fix compatibility issues with it. Framework 
contributors and maintainers accidentally break or deprecate features you came 
to rely on. Features you'll have to rewrite in order to upgrade.

On the scarier side, you don't realize that you're missing out on some new 
security features that — while they wouldn't require a security release that 
would be backported to your older version — still leave you and your customers 
a little less safe than the folks on the bleeding edge. 

You hear about performance improvements in your [ORM][orm] and you eagerly start
building internal apps using the new version of the framework in order to
giddily confirm that yes — it's much, much faster. You convince yourself that
this internal app side project written in Rails 4 and kept up-to-date with every
minor release since will better equip you to upgrade your shining 30,000 line of
code monolith — but it won't. No "greenfield" app can ever allow you to judge
how a "reddungeon" app will behave on the upgrade trails.

Things will break deep down at what seems to be the interpreter level. That is,
until you notice that a ridiculously ancient version of the antediluvian
[acts_as_list][asl] gem is attempting to pass hilariously unsupported arguments
to a core ActiveRecord method.

You start developing a near-animal instinct about what really causes exceptions
when reading stacktraces and this instinct betrays you because you're still
not reading the goddamned stacktraces.

Eventually you start reminiscing on the past two years and boil them down to
some recommendations that can hopefully prevent good people from spending as
much time as you did on those treacherous trails.

### Hindsights

### 1 — Don't Rush

Don't rush to update to a new version until at least a month (or two) after a
major or minor release because one tenth of your 238 transitive dependencies are
not compatible yet or their maintainers still don't know how to losen dependency
constraints. Get a pull request and a build going for sure, but wait until that 
first bugfix release comes out, and maybe a second one.

### 2 — Don't Lag

Don't wait to update until the following version is released. You will miss out
on all the blog posts, GitHub issues, and otherwise fresh conversations of
people with similar apps in similar situations and whose experiences you could
benefit from. I get that it's easier for other people to feel the upgrade pain, 
but it's time to become a better community citizen. Also your assumption that 
people who upgrade before you will save you from the weird bugs your app will 
encounter is flawed. There are always edge cases sitting in the dark waiting for 
**you**. 

No, I'm not talking about [Stranger Things][stranger].

### 3 — Subtract

Do use every single opportunity (Pull Request) to remove code and [drop
third-party dependencies][killdeps]. Not because they're evil, but because
they will demogorgons were real and could take some people away for ever to
the upside-down world of wheel reinventing. 

Seriously though, go [watch that show][stranger]. 

### 4 — New Defaults

Do learn about new framework defaults as early as you possibly can. Before
Rails 5, the only ways you could do that was by making new empty apps, or
running `rails rails:update`, or using [RailsDiff][railsdiff]. But now you
have [new_framework_defaults.rb][NFD] and that's
pretty cool.

### 5 — Don't Skip

Don't skip minor versions because you really really want to use ActionCable.
First off, [MessageBus is probably way better][messagebus]. More importantly,
you will miss all the deprecation warnings. You know what happens after a
deprecation warning? Shit gets removed. That shit that gets removed will be gone
and you will cry because your eyes can't process this many red dots at once and
you will think your eyes are bleeding. Yes. They are.

### 6 — Mini-majors

Take any opportunity to turn any framework minor version upgrade into a 
mini-major version upgrade if that makes sense. From watching Rails 4, I knew 
that [Strong Parameters][strongparams] were coming when I upgraded us to Rails
3.2, so I added the [strong_parameters][strongparamsgem] and converted our
models and controllers **before** we upgraded to Rails 4 so we would have one
less variable to account for.

### 7 — Changelogs

Always read changelogs. [Keep changelogs][keepachangelog]. Yeah, those Rails
release changelogs are not great because they're all split between indedepent
sub-components of the framework that few end-users care about. Yeah, there
should be more end-user friendly entries in the [Rails Upgrade Guides][rug]
but they are still very useful and you never know what you might notice and
get ready for **before** it's time for the big upgrade. Every Monday I get a 
rundown of the new versions released for every single dependency we have 
thanks to [Gemnasium][gemnasium]. Yes, that even includes the dreaded Bower 
and npm ones.

### 8 — Breaking News

Read the news. If you're not subscribed to [Ruby Weekly][rubyweekly], that's
the very **least** you could be doing to keep your ear to the ground. Even 
better, learn about what the Rails core team is working on by reading 
[This Week in Rails][TWIR] or great podcasts like [The Bikeshed][bikeshed].
You know what your team is currently working on and will work on for the 
next few months. So why don't you have the same curiosity when it comes to 
the people maintaining your most important software dependency? Want to go
commando on this one? Go to [RubyConf][rubyconf], [RailsConf][railsconf], and
great regional Ruby conferences so you can talk to these people. They are really
nice and will gladly listen to you, talk to you, and perhaps even empathize with
your upgrade pains or [fix regressions that affect you][fix] in new releases!


### 9 — Experiment

Play with new versions. I started working on an internal app called 
[Orientation][orientation] while suffering from Rails 5 envy in late 2012 
because I felt we needed a better way to document our knowledge dependencies 
(sense a theme?). It allowed me to learn what we could benefit from in this 
new version without having to worry about our dependency baggage and 
technical debt (yet). While I expected our main application to follow sooner, 
I was still able to keep Orientation in lockstep with all minor and major 
releases of Rails, which helped a lot with regards to the previous point.

### 10 - Blank

There is no tenth point. You make it. Share your upgrade stories; good or 
bad. They'll help people like you and me make better and more informed decisions 
about upgrading. The community will also benefit because we'll all talk about 
and work on making the upgrade process a little better with each new release.

---

This post was inspired by [a talk I first gave at the Orlando Ruby Users Group 
on August 11th][trailstalk].

Want me to share these Rails upgrade battle stories with your company or 
conference attendees? You can find ways to reach below.

Stay safe, stay upgraded.

[32prscreenshot]: {{site.url}}/assets/the-upgrade-trails.png
[cs]: https://www.codeschool.com
[asl]: https://github.com/swanandp/acts_as_list
[orm]: https://en.wikipedia.org/wiki/Object-relational_mapping
[killdeps]: http://www.mikeperham.com/2016/02/09/kill-your-dependencies/
[stranger]: https://www.netflix.com/title/80057281
[railsdiff]: http://railsdiff.org/
[NFD]: https://github.com/rails/rails/blob/6107a40c0e4d05614493bddf33d5ae8d9ce8a8d2/railties/lib/rails/generators/rails/app/templates/config/initializers/new_framework_defaults.rb.tt
[messagebus]: https://github.com/SamSaffron/message_bus
[strongparams]: http://api.rubyonrails.org/classes/ActionController/StrongParameters.html
[strongparamsgem]: https://github.com/rails/strong_parameters
[keepachangelog]: keepachangelog.com
[rug]: http://guides.rubyonrails.org/upgrading_ruby_on_rails.html
[gemnasium]: https://gemnasium.com/orientation/orientation
[rubyweekly]: http://rubyweekly.com
[TWIR]: http://weblog.rubyonrails.org/news/
[bikeshed]: http://bikeshed.fm/
[rubyconf]: http://rubyconf.org/
[railsconf]: http://railsconf.com/
[fix]: https://github.com/rails/rails/issues/25978#event-746667419
[orientation]: http://orientation.io/
[trailstalk]: {{site.url}}/talks/the-upgrade-trails
