---
layout: post
title: "Proposed implementation for Hash#contains?"
date: 2014-05-03 10:44
categories: development
draft: true
---

## Backstory
In a [recent blog post](http://olivierlacan.com/posts/proposal-for-a-better-ruby-hash-include/)
I mused about a handy method I've felt the need for when comparing hashes in Ruby.

The post was mostly composed of explanations, examples and a hacky Ruby-only
implementation. Of course MRI (Matz' Ruby Interpreter) Ruby is implemented in C,
so that was only the first step of the process.

## Along came a "Patch Monster"
As I was getting ready to publish the aforementioned post, I reached out to several
people I respect in the Ruby community, including [Terence Lee](http://hone.heroku.com)[^1].

After a few back and forths with Terence privately, he brought me into a
conversation with [Nobu](https://github.com/nobu) (who was given the monicker
"Patch Monster" due to his sheer amount of commits to Ruby core) who seemed to
think the idea was reasonable. We takled for a bit about how to name the method
since `Hash#include?` already exists and it would break the Ruby API to change
what an existing method does. We then debated the virtues of alterative names.

I left the conversation shortly after thinking it was fine to settle the matter of
the name later on, although I was pretty convinced of the good semantics of "contain(s)?".
After mere minutes, Terence messaged me a link to [this Gist](https://gist.github.com/nobu/dfe8ba14a48fc949f2ed).

Nobu had already implemented a patch in C to add a `Hash#comprised?` method, owning
up to his "Patch Monster" nickname. It took me more time to face the problem, think
about it, and propose the solution than it took him to solve.

How about that?

## Next step

First, I think the name needs to be changed to `Hash#contains?` and I've [forked
Nobu's Gist to reflect that suggestion](https://gist.github.com/olivierlacan/9658754b79153fc81222).

Second, I've created a [feature request on the Ruby bug tracker](https://bugs.ruby-lang.org/projects/ruby-trunk/issues).
This is my first ever, so there's a chance I did something wrong. And the patch
I've included isn't really a patch, it's a simple Git diff instead (it doesn't include any
commit metadata).

[^1]: Beyond the fact that Terence and I share a passion for all things delicious, he's one of the many people who make the Ruby community a joy to be a part of. He doesn't make brash public statements, instead he busts his ass behind the scenes to be the change he wants to see. There are many more like Terence, and they too deserve credit. This is why I'm incredibly proud that he received a [Ruby Hero Award in 2013](http://rubyheroes.com/#heroes). It's humbling to think that rebuilding the Ruby Heroes site (along with fellow Full Sail Students [Zachary Nicoll](http://zdn.me/) & [Andrew Smith](https://twitter.com/fullsailor)) was my first ever contribution to the Ruby community. It's not a popularity contest or a game of who's loudest. Many of these people were barely recognised when the community gave them a nod. Nowadays, many of them are the new pillars of the community.
