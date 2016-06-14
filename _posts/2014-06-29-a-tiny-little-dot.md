---
layout: post
title: "A Tiny Little ."
date: 2014-06-29 18:51
categories: development
---

For your own sake, don't run commands with `.` without thinking hard
about what you're doing.

Why? Because `.` means every directories here, right? So in your
development environment that probably means the cute little directories
you expected to be there.

In my development environment (Ruby on Rails), the only thing with spec files in it
for RSpec to run is that `/spec` folder. But what happens in my [CI](http://en.wikipedia.org/wiki/Continuous_integration)
environment if you use a wonderful testing service like [Travis CI](https://travis-ci.com/) (like we do) for instance?

There's a good chance you're also using the [`--deployment` Bundler flag](http://bundler.io/v1.6/man/bundle-install.1.html#DEPLOYMENT-MODE) for `bundle install`.

And if you ever try this, like I did today. Something really weird may
happen in your build, like this:

```
Could not load native IDN implementation.
/.../vendor/bundle/ruby/1.9.1/gems/backports-3.4.0/spec/tags/1.8.6/core/array/rotate_spec.rb:1:in `<top (required)>': undefined method `fails' for main:Object (NoMethodError)
  from /.../vendor/bundle/ruby/1.9.1/gems/activesupport-3.2.17/lib/active_support/dependencies.rb:245:in `load'
  from /.../vendor/bundle/ruby/1.9.1/gems/activesupport-3.2.17/lib/active_support/dependencies.rb:245:in `block in load'
  from /.../vendor/bundle/ruby/1.9.1/gems/activesupport-3.2.17/lib/active_support/dependencies.rb:236:in `load_dependency'
  from /.../vendor/bundle/ruby/1.9.1/gems/activesupport-3.2.17/lib/active_support/dependencies.rb:245:in `load'
  from /.../vendor/bundle/ruby/1.9.1/gems/rspec-core-2.14.8/lib/rspec/core/configuration.rb:896:in `block in load_spec_files'
  from /.../vendor/bundle/ruby/1.9.1/gems/rspec-core-2.14.8/lib/rspec/core/configuration.rb:896:in `each'
  from /.../vendor/bundle/ruby/1.9.1/gems/rspec-core-2.14.8/lib/rspec/core/configuration.rb:896:in `load_spec_files'
  from /.../vendor/bundle/ruby/1.9.1/gems/rspec-core-2.14.8/lib/rspec/core/command_line.rb:22:in `run'
  from /.../vendor/bundle/ruby/1.9.1/gems/rspec-core-2.14.8/lib/rspec/core/runner.rb:80:in `run'
  from /.../vendor/bundle/ruby/1.9.1/gems/rspec-core-2.14.8/lib/rspec/core/runner.rb:17:in `block in autorun'
```

The first thing you'll notice is this super weird `Could not load native IDN implementation.`
error. And you'll stare at it. You'll try to poke holes through it like this fella:

![Clint Eastwood Trying Kill Your Stracktrace With His COLD BARE EYES](/images/clint_eastwood_death_stare.jpg)

Eventually, you'll Google this weird error message and find this line in the
[addressable](https://github.com/sporkmonger/addressable/blob/master/spec/addressable/idna_spec.rb#L249) gem:

```ruby
rescue LoadError
  # Cannot test the native implementation without libidn support.
  warn('Could not load native IDN implementation.')
end
```

Hmm. `libidn`, what is that? And do I even have addressable in my Gemfile?
Nope... Wait, it's a dependency of [`launchy`](https://github.com/copiousfreetime/launchy)
and [`webmock`](https://github.com/bblimke/webmock). So... maybe I did
something wrong... but WAIT?

![A fake epiphany that actually never happened because it's really Josh Kalderimis who figured this out](/images/house_epiphany.gif)

Why is the [`rotate_spec.rb`](https://github.com/marcandre/backports/blob/master/spec/tags/1.8.6/core/array/rotate_spec.rb#L1) from the `backports` gem even running in
my build?! How is that even...

> As a result, bundle install --deployment installs gems to the **vendor/bundle** directory in the application. This may be overridden using the --path option.
> — http://bundler.io/

Since I was using the following features in my `.travis.yml` file:

```yaml
bundler_args: --deployment
# ...
script:
  - bin/rspec . --color --profile --format RSpec::Instafail
```

The `vendor/bundle` directory was filled with cached gems before the build
started running with `bin/rspec .`. Because of that single little `.` RSpec
went to town on all the spec files inside of all my gems, and eventually
(thankfully) exploded one which had dependencies that couldn't be satisfied.

I have to thank [Josh Kalderimis](http://bitsandthoughts.com/) from Travis CI
for his invaluable help figuring this out. Basically the entire "eureka moment"
in this post actually went on in his head as I sat there stuck in
my Clint Eastwood phase.

This was a good reminder of something I've oddly been repeating to people
a lot lately: **DO NOT FLIP OUT WHEN AN ERROR OCCURS**.

Reading stacktraces is most definitely a path down the rabbit hole.
Although the first time I encountered this error I didn't
have time to pursue its debugging, I really should have *made* some time.

As I suspected — and as Josh also found — the stacktrace was a [red herring](http://en.wikipedia.org/wiki/Red_herring)
since it was in fact not the cause of the problem, but a symptom. Following
the stacktrace only made us more and more bewildered as to why this
spec was even running in the first place. Especially since it didn't happen
on my development machine.

Thankfully, Josh started looking at stuff I took entirely for granted.
That's why sanity checking with somebody else is so important in exceptional
situations like this. You don't have to love pairing to use a pair of fresh eyes and
sometimes (often) they'll question something you would have looked at but
never **seen** at the first glance. That's basically what happened here.

There's a thing that happens a lot when you don't really understand something.
You go into a "there's an error message on the screen" mode.

Despite the fact that all you need is to relax and read everything carefully, you (I) tend to
get upset and flail your arms uncontrollably at your screen somehow hoping
that the singularity will occur and it will develop shame and fix itself
to appease you.

That won't happen. Errors mean you have to grab something that relaxes you
(tea, a book, a teddybear) and go into Sherlock mode. Everything is up for
grabs. Every little detail matters, especially the most mundane one, like
a tiny little fucking dot.
