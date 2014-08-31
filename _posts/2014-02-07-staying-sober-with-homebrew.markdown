---
layout: post
title: "Staying Sober with Homebrew"
date: 2014-02-07 17:00
categories: development
draft: true
---

[Homebrew](http://brew.sh/) is fantastic. If you're doing any web development,
programming, video work — basically anything cool — with your Mac, you owe it to
yourself to use Homebrew instead of:

- using installers (DMGs) for things like Git because you can't upgrade without
going out to download a whole new installer (maybe) and that's just plain tedious.
- compiling binaries from source (if you don't understand, don't worry, Homebrew
does that for you) because if you wanted to do that you'd be using Linux, and even
then not really.
- using MacPorts which served the same purpose but is less used today for diverse
reasons.

## What is Homebrew?

Homebrew is a package manager. Think of it like the Mac App Store, except
everything you're installing with it is free and open source software.
Instead of apps with graphical user interfaces (GUIs), it allows you to install
(and upgrade) simple command line applications which are often referred to as
"binaries" because when you compile human-readable source code it becomes
machine-readable binary code (0s and 1s). This is also why these "binaries" are
installed in directories called `bin`.

## Why do you need it?
Why do you need command line executables? Well, say you want to start making web
applications using Ruby on Rails, or Node.js, or Go. There's a good chance someone
will tell you to install:

- git to version control your files while developing
- hub to make Git play nicely with GitHub
- PostgreSQL to use as a database
- nvm to easily switch between versions of Node.js
- npm to install Node modules
- maybe rbenv & ruby-build to install and switch Ruby versions easily.
- imagemagick to do image manipulation
- ffmpeg to do video manipulation
- pretty much [anything you can think of](http://braumeister.org/).

## How do you install it?

It's actually easy to install. All you need to do is go to the [Homebrew website](http://brew.sh/)
and copy the line of code in the "Install Homebrew" section into your Terminal.
This practice of making you execute a random line of code on your machine is
generally bad. It's especially bad if said line of code downloads a script
from a remote server in order to execute more code — and that's exactly what
Homebrew's easy install does.

If you're security-minded (and you should be), there is also a [simple *enough*
way to install Homebrew a bit more safely](https://github.com/Homebrew/homebrew/wiki/Installation#untar-anywhere).
Do install it inside of `/usr/local` though, don't get fancy.


## Is that it? No, of course.
Homebrew needs to compile, and in order to compile you need Apple's Command Line Tools.
In any recent version of OS X, you can simple run `xcode-select --install` inside of
your Terminal and you'll be guided to install them.

Otherwise, I believe the only alternative with the recent Xcode (5.1.1 at the time
I'm writing this) which doesn't ship with Command Line Tools pre-installed or
make them available to download within the preferences is to sign up for a free
Apple Developer account and grab them from the [Downloads section of the site](https://developer.apple.com/downloads/index.action?name=for%20Xcode%20-).

![Screenshot of the Apple Developer Downloads section]({{ site.url }}/images/apple_developers_downloads.png)
