---
layout: post
title: "Brewing With Homebrew"
date: 2011-08-06 14:05
comments: true
categories: development
---

## What is Homebrew?

[Homebrew](http://mxcl.github.com/homebrew/) is the best package manager available for Mac. If you've heard of [MacPorts](http://www.macports.org/), I strongly urge you to consider switching to it.

If the concept of a package manager is foreign to you, let me explain. Most development tools are open-source projects, you can't really do much with the source code of something if it's an application supposed to run on your computer. In order to run an app, you have to compile the source code into an executable file.

If you have a unix/linux background, that's something you would be used to do, it would also increase dramatically the chances that you sport a neckbeard. So I'll assume almost none of you do.

Compiling source code can be tricky, there are dependencies (other executables that this application needs in order to function) and configurations that can turn a simple installation into hours of scouring for contradictory bits of information on obscure forums.

That's where Homebrew comes it. It's easy to install and the way it avoids making you configure and check for dependencies is by offering "formulas" – simple little scripts written in [Ruby](http://rubylang.info/) (which comes bundled with Mac OS X) – that will do dependency checking and configuration for you. And while Homebrew is a command line utility, it gives you a lot of intelligible feedback on what it needs from you, and what it's doing.

Better yet, unlike MacPorts, Homebrew installs itself within your `/usr/local/` directory and makes you the owner of all directory it installs applications into. It sounds banal, but it means you'll never have to "sudo" (perform actions as the administrator account) when you need to install or upgrade executables.

The other advantage of installing things in `/usr/local/Cellar` is that Homebrew does not override any system installation. All it does is "symlink" (think of it as putting a shortcut) to its own Cellar.

## What can I install with Homebrew?

* [Ruby](http://rubylang.info/)
* [Python](http://www.python.org/)
* [NodeJS](http://nodejs.org/)
* [ffMPEG](http://www.ffmpeg.org/)
* [MongoDB](http://www.mongodb.org/)
* [Redis](http://redis.io/)
* [Memcached](http://memcached.org/)
* [MySQL](http://www.mysql.com/)
* [PostgreSQL](http://www.postgresql.org/)
* [MacVim](http://code.google.com/p/macvim/)
* [YUIcompressor](http://developer.yahoo.com/yui/compressor/)
* [ImageMagick](http://www.imagemagick.org/script/index.php)
* [Git](http://git-scm.com/)
* [Clojure](http://clojure.org/)
* [Erlang](http://www.erlang.org/)
* [CoffeeScript](http://jashkenas.github.com/coffee-script/)

And the list goes on, just type `brew search something` to find out if a formula exists. If you want the whole list, simple type `brew search`.

## Great, where do I get it?

[Learn more about Homebrew here](http://mxcl.github.com/homebrew/)

[Install it quickly with these simple instructions.](https://github.com/mxcl/homebrew/wiki/installation)