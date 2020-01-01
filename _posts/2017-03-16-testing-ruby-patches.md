---
title: Testing Ruby Patches
layout: post
original: '2017-03-16 9:12:00'
date: '2019-12-28 9:12:00'
location: Paris, France
categories:
  - ruby
  - development
draft: true
---

So you have this [genius idea][1] for how to improve Ruby, but even though you
know how to write *in* Ruby, you don't know really know enough C, Java, or C++
to get out of awkward whiteboard interview so your potentially cool idea to
[polish Ruby] up a bit won't see the light of day unless you beg someone on an
[issue tracker][3] to do it for you.

I've been there my friend. Slowly but surely I've found my way out, and so can
you.

## Installing Ruby From Source

You probably know how to [install Ruby][4]. There are a lot of ways. The least
prefered by most people, and the least practical in most regards, is to compile
Ruby from source. Essentially praying that your machine has all the necessary
dependencies available and slapping a big red button until it's either installed
or you're faced with a lot of indecipherable error messages. Worse, you might
even see those if the install works out fine.

Compiling and installing from the Ruby source code itself gives you an
advantages: the source. Since you can touch it, you can change it. But first
you'll need to get the source on your machine. You can [download it][7] an
archive of a stable release or a snapshot of the most recent changes, then
extract the archive on your machine. But where's the fun in that when you can
`git clone` the [ruby repository on GitHub][8] and get all the versioning
history for free? Nowhere.

Better still, we'll see later that git makes it easier to generate patch files
from the git diff command output. So let's go:

```bash
cd ~
git clone https://github.com/ruby/ruby.git
cd ruby
autoconf
./configure
```

So let's say you wanted to change the version of Ruby. You could easily do that
thanks to the [`version.h file`][5] which contains the `RUBY_VERSION` definition.
Say hello to Ruby 42, or [9000][6]!


If you're running a recent version of macOS, it's likely that you'll get some
error involving OpenSSL. There's a fairly simple [way around that][9].

Now, `make` and `make check` don't actually install Ruby on your machine, they
merely compile its source code into a binary file. To install it properly into
`/usr/local/bin` you'll have to run `make install`. But let's not do that just
yet since we want to apply our patch to

##




[1]: /posts/better-feedback-on-ruby-2-2-keyword-argument-errors/
[2]: /talks/polishing-ruby/
[3]: https://bugs.ruby-lang.org/issues/
[4]: https://www.ruby-lang.org/en/documentation/installation/
[5]: https://github.com/ruby/ruby/blob/trunk/version.h#L1
[6]: http://blog.jruby.org/2015/07/jruby_9000/
[7]: https://www.ruby-lang.org/en/documentation/installation/#building-from-source
[8]: https://github.com/ruby/ruby
[9]: http://engineering.appfolio.com/appfolio-engineering/2016/6/17/configuring-ruby-on-macos-with-openssl
