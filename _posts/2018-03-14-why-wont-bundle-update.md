---
title: Why Won't Bundle Update
layout: post
date: '2018-03-14 18:20:00'
location: Saint-Anne, Martinique, France
categories:
  - ruby
draft: true
---

You just received notification from GitHub's nifty new repository
dependency scanner that there is a critical vulnerability report for
the Nokogiri Ruby gem you currently have locked to version 1.6.8.1 in
your Rails application's Gemfile.

It looks a little bit like this:

![]({{ site.url }}/assets/bundle_update_nokogiri.png)

Concerned, you decide to immediately update this dependency, run your
test suite, and deploy to production to prevent even the remote
possibility of an exploitation of this vulnerability in your application.

```
bundle update nokogiri
Fetching gem metadata from https://rubygems.org/.........
(... coffee (or Mamba) time! ...)
Bundler attempted to update nokogiri but its version stayed the same
Bundle updated!
```

Wait, what? Why is it saying "Bundle update!" if "Bundler attempted to
update nokogiri but its version stayed the same"? That's not really
what I call updated. But sure. In a situation like this I really wish
that Bundler would tell me why it failed its attempt to update nokogiri.

Why won't it bundle update nokogiri? There visibly was no error, so
there must be a version requirement preventing this update I just
requested. My first insinct is to check the `Gemfile.lock` and sift
through any mention of `nokogiri` to see if there isn't one requirement
that's a bit too strict and causing this issue.

But then I stop myself. Why the hell isn't my supposed best package
manager of any language ever not doing this work for me. Why am I left
grepping through a Lockfile of all things like a lowly machine?

There has to be a better way, right? Well...

There is something in RubyGems that allows you to check the installed
gem dependencies for a specific gem. You can ask `gem dependency nokogir`
and RubyGems will tell you — for each version of nokogiri — what gems
depend on that specific version:

```
$ gem dependency nokogiri
Gem nokogiri-1.6.8.1
  mini_portile2 (~> 2.1.0)
  minitest (~> 5.8.4, development)
  racc (~> 1.4.14, development)
  rake (~> 10.5.0, development)
  rake-compiler (~> 0.9.2, development)
  rake-compiler-dock (~> 0.5.1, development)
  rdoc (~> 4.0, development)
  rexical (~> 1.0.5, development)
```

You might hope that perhaps Bundler implements similiar functionality
that is instead Gemfile-aware. Wouldn't that be neat? Something like:

```
bundler dependencies nokogiri
  mini_portile2 (~> 2.1.0)
  minitest (~> 5.8.4, development)
  racc (~> 1.4.14, development)
  rake (~> 10.5.0, development)
  rake-compiler (~> 0.9.2, development)
  rake-compiler-dock (~> 0.5.1, development)
  rdoc (~> 4.0, development)
  rexical (~> 1.0.5, development)
```

I'm sorry to say, Bundler offers no such thing. At least none that I
could find in its documentation, source, issues, or pull requests.

But there's hope. The kind Joe Mastey has created a little gem called
[bundler-stats][1] which allows to get some basic statistics about your
Gemfile dependencies. bundler-stats can sift through your Gemfile and
figure out how many transitive dependencies each of the gems declared
in your Gemfile are pulling along, which is quite useful. What I wanted
however is an extension to the `bundler-stats show <gemname>` command
which finds all gems in your Gemfile which depend on the target gem.

```
$ bundle-stats show nokogiri
bundle-stats for nokogiri

depended upon by (34) | actioncable, actionmailer, actionpack,
actionview, approvals, capybara, capybara-screenshot, chromedriver-
helper, coffee-rails, devise, devise-two-factor, draper, formtastic,
gretel, haml-rails, html2haml, inline_svg, loofah, prawn_rails, rails,
rails-controller-testing, rails-dom-testing, rails-html-sanitizer,
railties, responders, rspec-rails, sassc-rails, sprockets-rails, xpath
depends on (1)      | mini_portile2
unique to this (1)   | mini_portile2
```

If only I could have had the version of nokogiri required for each of
those gems listed alongside them I could have easily figured out which
was holding nokigiri's update back.

...

So I added `bundle-stats versions nokogiri`. :-D

```
$ bundle-stats versions nokogiri
bundle-stats for nokogiri

depended upon by (34):
+------------------------------|-------------------+
| Name                         | Required Version  |
+------------------------------|-------------------+
| capybara-screenshot          | >= 1.3.3          |
| capybara                     | >= 1.3.3          |
| loofah                       | >= 1.5.9          |
| rails-html-sanitizer         | >= 1.5.9          |
| coffee-rails                 | >= 1.6            |
| devise                       | >= 1.6            |
| formtastic                   | >= 1.6            |
| google-rails                 | >= 1.6            |
| haml-rails                   | >= 1.6            |
| prawn_rails                  | >= 1.6            |
| rails                        | >= 1.6            |
| rails-controller-testing     | >= 1.6            |
| rails-dom-testing            | >= 1.6            |
| xpath                        | ~> 1.3            |
| inline_svg                   | ~> 1.6            |
| chromedriver-helper          | ~> 1.6            |
| approvals                    | ~> 1.6            |
| html2haml                    | ~> 1.6.0          |
+------------------------------|-------------------+
```

This tells me that haml2haml (2.0.0) is being a little overspecific
with the version of nokogiri it is requiring. All the other requirements
should allow nokogiri 1.8.x to be installed but this one won't.

A quick check on RubyGems.org shows me that html2haml 2.1 and later
fixed this restrictive requirement.

After checking `bundle-stats versions html2haml`, I don't see a specific
requirement for html2haml 2.0.0:

```
$ bundle-stats versions html2haml
bundle-stats for html2haml

depended upon by (1):
+------------------------------|-------------------+
| Name                         | Required Version  |
+------------------------------|-------------------+
| haml-rails                   | >= 1.0.1          |
+------------------------------|-------------------+
```

I can now be confident that running the following command will
successfully update nokogiri:

```
bundle update html2haml nokogiri
```

This new `bundle-stats versions <gemname>` is not yet available in the
released version of bundler-stats but it hopefully will be soon. I hope
we can convince the Bundler team that this sort of feature is a
must-have for a modern package manager.

[1]: https://github.com/jmmastey/bundler-stats
