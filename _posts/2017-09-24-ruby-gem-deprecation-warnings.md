---
title: Ruby gem deprecation warnings
layout: post
date: '2017-09-24 06:33:00'
location: Paris, France
categories:
  - development
  - ruby
draft: true
---
Some of the trickier deprecation warnings to find culprits for are those
which arise at require time — when your application boots and Bundler is
requiring the gems in your Gemfile.

```ruby
bin/rails server

DEPRECATION WARNING: alias_method_chain is deprecated. Please, use Module#prepend instead. From module, you can access the original method using super. (called from <top (required)> at /.../config/application.rb:7)
DEPRECATION WARNING: alias_method_chain is deprecated. Please, use Module#prepend instead. From module, you can access the original method using super. (called from <top (required)> at /.../config/application.rb:7)
DEPRECATION WARNING: alias_method_chain is deprecated. Please, use Module#prepend instead. From module, you can access the original method using super. (called from <top (required)> at /.../config/application.rb:7)
=> Booting Puma
=> Rails 5.0.0 application starting in development on http://localhost:3000
=> Run `rails server -h` for more startup options
Puma starting in single mode...
* Version 3.6.0 (ruby 2.3.4-p301), codename: Sleepy Sunday Serenity
* Min threads: 5, max threads: 5
* Environment: development
* Listening on tcp://localhost:3000
Use Ctrl-C to stop
```

Thankfully that gives us a centralized place to snoop in and try to
correlate the warnings with a specific gem.

The call site listed in the warnings isn't a specific gem or line of
code from my application. Instead it's the
`Bundler.require(*Rails.groups)` call from Rails'
`config/application.rb`.

From here we have several options:
- read the Bundler source code to try and find where `Bundler.require`
  is defined and what it does.
- run `bundle show bundler` to see where Bundler is installed locally so
  that we can simply search for `def self.require` or `def require` in
  case someone's getting fancy with the [eigenclass][1] again.
- open IRB, run `require "bundler"` and
  `Bundler.method(:require).source_location` to let Ruby tell us where
  that `require` method is defined exactly.

Those are all valid methods which may be more suitable depending on your
context, and you run the risk of learning a few interesting things with
each of them.

Now that we know where `Bundler.require` is, let's figure out if we can
have it help us find our answer.

The method definition itself isn't very helpful:

```ruby
def require(*groups)
  setup(*groups).require(*groups)
end
```

It looks like `setup` does something, but that perhaps the things we
should hone in on is `require` since it probably... requires gems.

And since `require` is being called on the return value from `setup` it
looks like there's another `require` method definition somewhere else.
We can search for `def require` again and try to get lucky or we can try
to figure out what object is being returned from `Bundler.setup`. I
really don't recommend running that one in an IRB console because
depending on your local Gemfile this could take a really long time.

Instead we can see that `Bundler.setup`'s method definition ends in this
conditional:

```ruby
if groups.empty?
  # Load all groups, but only once
  @setup = load.setup
else
  load.setup(*groups)
end
```

Clearly, the `load` method is involved somehow. Let's see:

```ruby
def load
  @load ||= Runtime.new(root, definition)
end
```

Looks like the Runtime class is where we should be looking. And indeed,
it does define its own `require`. Better yet, early in the (very long)
method definition, we can spot a loop over `@definition.dependencies`:

```ruby
@definition.dependencies.each do |dep|
  # ...
end
```

I couldn't dream of a better place to go full [debuggerer][2] and place
a puts. If you're running Ruby 2.4+ you could also use `binding.irb` to
interrupt the execution of this loop but doing so for dozens of gem
would be very tedious. Let's just use [STDOUT] instead:

```ruby
@definition.dependencies.each do |dep|
  puts dep
  # ...
end
```

Assuming you're still within your local Bundler code (located with
`bundle show bundler`) you can now save, and start your application
again. You should see the names and specified versions of all your gems
listed as your application starts:

```
...
faraday (>= 0)
faraday_middleware (>= 0)
formtastic (~> 3.1.2)
friendly_id (~> 5.2.0)
gretel (~> 3.0.8)
DEPRECATION WARNING: alias_method_chain is deprecated. Please, use Module#prepend instead. From module, you can access the original method using super. (called from <top (required)> at /.../config/application.rb:7)
DEPRECATION WARNING: alias_method_chain is deprecated. Please, use Module#prepend instead. From module, you can access the original method using super. (called from <top (required)> at /.../config/application.rb:7)
DEPRECATION WARNING: alias_method_chain is deprecated. Please, use Module#prepend instead. From module, you can access the original method using super. (called from <top (required)> at /.../config/application.rb:7)
```

And there we have it. Just above the deprecation warnings, `gretel (~>
3.0.8)` is listed.

We can double check that gretel does call `alias_method_chain` by
opening it up:

```
bundle open gretel
```

And a quick search reveals exactly three separate calls:

```
Searching 71 files for "alias_method_chain" (case sensitive)

/Users/olivierlacan/.rbenv/versions/2.3.4/lib/ruby/gems/2.3.0/gems/gretel-3.0.8/lib/gretel/deprecated/default_style_key.rb:
    8    end
    9
   10:   alias_method_chain :options_for_style, :default_style_key
   11  end

/Users/olivierlacan/.rbenv/versions/2.3.4/lib/ruby/gems/2.3.0/gems/gretel-3.0.8/lib/gretel/deprecated/show_root_alone.rb:
    9    end
   10
   11:   alias_method_chain :options_for_render, :show_root_alone
   12  end

/Users/olivierlacan/.rbenv/versions/2.3.4/lib/ruby/gems/2.3.0/gems/gretel-3.0.8/lib/gretel/deprecated/yield_links.rb:
   17    end
   18
   19:   alias_method_chain :breadcrumbs, :yield_links
   20  end
```

Thankfully, there's a new version of gretel out and the repo even has a
nice [changelog entry for version 3.0.9][4] which tackles this very
issue:

```
Fixes deprecation warnings for alias_method_chain (via #66)
```

One `bundle update gretel` later, no more deprecation warnings at boot
time. As a side benefit we learned a bunch about how Bundler requires
our dependencies and if we're ever in the mood to dive deeper, the
`Runtime#require` method from Bundler is eagerly awaiting.

[1]: https://stackoverflow.com/a/2505077/385622
[2]: https://tenderlovemaking.com/2016/02/05/i-am-a-puts-debuggerer.html
[3]: https://en.wikipedia.org/wiki/Standard_streams#Standard_output_.28stdout.29
[4]: https://github.com/lassebunk/gretel/blob/master/CHANGELOG.md#version-309
[5]: https://github.com/bundler/bundler/blob/1b1db94e045cdf690bc93939612d17d7ee44c369/lib/bundler/runtime.rb#L63-L105
