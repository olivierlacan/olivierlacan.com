---
layout: post
title: "Upgrading to OS X 10.9 with a Development Environment"
date: 2013-11-12 16:00
---

I held back for a few weeks because new OS X releases are usually pretty unstable when it comes to development tools. I finally decided to update to Mavericks after encountering some Bluetooth connection issues I hoped Mavericks would resolve (nope).

First, I made sure I had my portable hard drive back up my system using Time Machine, to account for dire situations. I have most of my absolutely crucial files backed up to Dropbox continually anyway, but it would be a pain to re-install everything if I didn't have a Time Machine backup handy.

The Mavericks update process was uneventful and took about 35 minutes which were a perfect excuse to brew some tea and read a few pages on the hammock. Tough trade we're in.

My first step after restarted with a wall of Californian water was to jump to `System Preferences > Security & Privacy` since two apps I use were asking for me to turn the "assistive devices" feature back on. This feature has basically moved around the System Preferences in every recent release of OS X so it's a good thing Mizage (the makers of [Divvy](http://mizage.com/divvy/)) offers a guide. Sadly their guide is out-of-date (made for 10.8), so here's where you can enable access for assistive devices on 10.9.

![Screenshot of OS X System Preferences Privacy & Security screen]({{ site.url }}/assets/mavericks-privacy-security-screen.png)

I enjoy the fact that this is now a [whitelist](http://en.wikipedia.org/wiki/Whitelist) instead of a global toggle as it was in 10.8. I can now control which apps can take control of my operating system's input devices, instead of granting that privilege to anything I have installed. Thumbs up for security there, Apple.

Second step once [TextExpander](http://smilesoftware.com/TextExpander/index.html) and Divvy were back in service was to open the Terminal app and run `brew doctor`. [Homebrew](http://brew.sh/) is a package manager for command line utilities that makes life extremely easy for developers. If you don't already use it (or you still use the antiquated MacPorts) you should.

![Screenshot of brew doctor command results]({{ site.url }}/assets/mavericks-brew-doctor-results.png)

[XQuartz](http://xquartz.macosforge.org/landing/) started being necessary (as a standalone install) since 10.8 I believe, and it's fairly simple to [download and install](http://xquartz.macosforge.org/trac/wiki/X112.7.5), especially since the Homebrew folks do most of the work for your.

Next step was `xcode-select --install` which will open Xcode and make it prompt you to download and install Command Line Tools. Remember that the CLTs which Apple now ships independently of Xcode make it unecessary to use Kenneth Reitz' nifty [OS X GCC Installer](https://github.com/kennethreitz/osx-gcc-installer) which was often necessary with OS X 10.7 (Lion) and 10.8 (Mountain Lion) when Apple screwed up most Mac development environments pretty badly.

I'm not exactly sure why autoconf, automake and libtool showed up as unlinked. This may have something to do with the upgrade process messing with the file system. mysql is something I manually uninstalled prior to upgrading to Mavericks, so you can ignore that one.

Fixing those is rather easy.

![Screenshot of brew link autoconf results]({{ site.url }}/assets/mavericks-brew-link-autoconf.png)
![Screenshot of brew link automake results]({{ site.url }}/assets/mavericks-brew-link-automake.png)
![Screenshot of brew link libtool results]({{ site.url }}/assets/mavericks-brew-link-autoconf.png)

After all this, re-running `brew doctor` is a good idea, to see where things are.

Since I couldn't `brew link mysql` because I had uninstalled it, I googled around and found that `brew remove --force mysql` would get rid of it altogether. Nifty trick, especially since Homebrew insisted I had "multiple versions installed". I didn't. I never use the damn thing. Switch to [PostgreSQL](http://www.postgresql.org/) by the way, you'll thank me in a few years.

Finally a little `brew update` to fetch new formulae (recipes to install packages in Homebrew parlance). One last `brew doctor` and the satisfying result:

> Your system is ready to brew.

## State of the Rubies
I use [rbenv](http://rbenv.org/) to manage a myriad of different Ruby versions required by old apps I built in college which use Ruby MRI 1.8.x, somewhat old apps I built after college which use Ruby MRI 1.9.2, and most of our Envy Labs and Code School apps which use various patch levels of MRI 1.9.2, 1.9.3, 2.0.0, JRuby, etc.

After using [RVM](http://rvm.io/) for several years, I highly recommend rbenv because of its simplicity. There's a caveat. I'm fairly familiar with Unix by now, and it's very likely that if you're not as familiar you will prefer RVM overall. That said, as someone who easily becomes frustrated with latency, I'm under the impression rbenv is faster. It's very likely bias on my part because I used RVM a while back on older machines and because I've become better at streamlining my system. Aesthetically, I find myself enjoying the simplicity of rbenv as well.

I use rbenv with the following plugins installed in `~/.rbenv/plugins`:
- [rbenv-bundler](https://github.com/carsomyr/rbenv-bundler) which prevents me from having to type `bundle exec <gemname>` for gems with executables installed via a project's Gemfile.
- [rbenv-gem-rehash](https://github.com/sstephenson/rbenv-gem-rehash) which automatically runs `rbenv rehash` for you after installing gems with executable binaries so you can instantly use said binaries without reloading your prompt or manually running `rbenv rehash`.
- [ruby-build](https://github.com/sstephenson/ruby-build) which allows me to run `rbenv install 2.0.0-p247` directly when I need to install a Ruby version.

After installing Mavericks, `rbenv` was fully functional and I managed to install Ruby 2.1.0-preview1 without a hitch. Better yet, all my existing Rubies worked fine and I was able to fire up [Powder](https://github.com/Rodreegez/powder) — a lovely little gem I use to manage [Pow](http://pow.cx/) for all my Rails projects so I don't have to manually setup their `rails server` on different ports.

This was by far the smoothest OS X upgrade experience I've ever had with a Rails development environment installed on my machine. That doesn't mean I won't run into some hiccups later, but it's reassuring for people like me who stay away from upgrades for fear of having a day of work ruined trying to get things back to normal.

PS: If you enjoy all these talks of tools, you should check out my [toolbelt](http://olivierlacan.com/tools/).
