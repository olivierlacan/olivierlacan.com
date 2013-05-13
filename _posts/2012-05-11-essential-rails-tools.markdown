---
layout: post
title: "Essential Rails Tools"
date: 2012-05-11 00:56
comments: true
categories: development
---

I've presented a talk called Essential Rails Tools at [RailsConf 2012](http://railsconf2012.com/) in Austin, Texas last April and more recently at the [Orlando Ruby User Group](http://orug.org/) (ORUG) on May 10th, 2012.

My contention was that despite contrary claims made in [some venues](http://news.ycombinator.com), there is no reason to be nostalgic of the *good old days* of Rails 1.x and 2.x. The simplicity of those early versions was far less joyful than [rosy retrospection](http://en.wikipedia.org/wiki/Rosy_retrospection) would have you remember, providing you do. Rails 3.0 and later version have introduced refinement, which can be confused with complexity but only on a superficial level. 

Rails has always been about convention over configuration, and in order for conventions to be attained iteration and refinements must occur. Convention by its very nature implies a steeper learning curve, but its payback comes in the reusabibility of standardized knowledge.

My goal with this talk was to introduce newcomers to the Rails ecosystem by showing them some of the best development tools available. Another focus was trying to reassure people who come from Integrated Development Environments (IDEs) like Xcode, Eclipse or — dog forbid — Visual Studio and show them that a lightweight toolbelt can offer plenty of support for debugging, managing dependencies and a development environment.

## Slides

<script async class="speakerdeck-embed" data-id="4f9718f96fda0a001f01f174" data-ratio="1.3333333333333333" src="//speakerdeck.com/assets/embed.js"></script>

## Command Line Tools

I've gathered here some information and resources about the tools I introduced in this talk. Let's start with some Unix tools that should be the foundation of your development environment.

### [Homebrew](http://mxcl.github.com/homebrew/)

Homebrew is the best package manager for the OS X ecosystem. 

A package manager is tool that does several key things for you:

1. Resolve dependencies for the piece of software you're trying to install.
2. Download each piece of software's source code.
3. Configure the source to be compatible with your system.
4. Compile the source into an executable *binary* program.
5. Allow you to upgrade any of these binaries very easily.

That's a lot of stuff right there. Things that you don't have to worry about when installing something from a disk image (.dmg files) or from the Mac App Store since those are already compiled into executable programs for you. 

You might (and should) ask: why not download pre-compiled executables instead of their source code? For several programs, Git for instance, you can actually do that by going to [Git's official website](http://git-scm.com/) and hit the download section. 

For many other programs, it's not that easy. There are intricate interractions with other programs on your system that need to be accounted for before an executable version can be created and function properly on your system. Just to be clear, an executable is a program that can be launched, an application in modern parlance. The source code of a Unix program can't be executed before that program has been compiled, that's just the way it is.

Now if you've been doing development on a Mac for a while, you might have heard of MacPorts. It's also a package manager which was a predecessor to Homebrew and up until a few years ago was used by a majority. The reason a majority of developers have moved on to using Homebrew are multiple.

For one, MacPorts used convoluted ways to install programs since it didn't use several libraries and software already available on OS X which resulted in slow installation and complex dependencies. Complexity is something people shy away with in this realm because having many moving parts is often a recipe for issues.

Homebrew takes a simpler and more lightweight approach. While at first it didn't offer as many installation recipes (or formulaes in Homebrew-speak) as MacPorts, the fact that formulaes are written in simple Ruby allowed the stable of programs it was capable of installing to grow at a fast rate. So much that it's hard to find anything that you can't install with Homebrew. 

I mentioned several of the popular packages available through Homebrew in a previous post called [Brewing with Homebrew](http://blog.olivierlacan.com/posts/brewing-with-homebrew/). You'll also find instructions on how to install it there.

If you had been using MacPorts for a while, [Moving from MacPorts](http://bitboxer.de/2010/06/03/moving-from-macports-to-homebrew/) is a great article that more reasons to switch and simple instructions on how to do so.

### [AutoJump](https://github.com/joelthelion/autojump)

A great little utility that remembers folders you've `cd`-ed into and allows you to "jump" to them from anywhere simply by typing `j <foldername>`. For instance, once I've done `cd ~/Development/envylabs/codeschool/` once, I can just type in `j code` and it will take me straight there. `j c` will also work until you `cd` into another folder that starts with a C, at which point you'll have to be a little more specific. It's extremely useful once you start navigating around many different folders and files on the command line. It feels like using Spotlight, Quicksilver or Alfred on the Terminal.

## Ruby Gems

Here's a quick breakdown of the interesting gems I mention in this talk. All of them offer command line interfaces (or CLIs) which allow you to interact directly with them from the command line and send them commands.

### [RVM](http://rvm.io)

RVM has been for years the only way to manage multiple versions of Ruby on a single development machine, and before the advent of Bundler with Rails 3, it also served as a way to prevent collisions between gems (Ruby libraries) installed on your system. Its relevance has nowadays been lessened by the more simple [rbenv](https://github.com/sstephenson/rbenv)  and the `bundle exec` command offered by Bundler, but it's still a good choice for beginners.

If you're not a fan of managing Ruby versions and Gemsets through the command line on a daily basis (you shouldn't if you're using `.rvmrc` files, but nobody's perfect) you should take a look at [JewelryBox](http://unfiniti.com/software/mac/jewelrybox), a free graphical user interface for RVM for OS X.

### [Pow](http://pow.cx)

Once you start working with more than a single Rails application and you need to run more than one at the same time it can become tedious to start a web server for each using the `rails server` command every time. It also means you have to start assigning ports to each server to prevent collisions.

Pow is a simple little tool built by the 37signals team that allows you to assign a made-up domain name to each of your apps. Whenever you enter that domain name in your favorite browser, Pow will start a Rails server for you and launch the app in your browser. Not only is it convenient, it can become crucial when you're building two apps that depend on one another to function.

Better yet, in this world of powerful little tools, another Gem called [powder](https://github.com/rodreegez/powder) provides you with an interface to install and manage all your Pow servers. It gives you convenient commands to create specific domain names for a given app, watch its development log, and restart it. 

There's an inherent issue with Pow that causes it to stop working once an Internet connection isn't available for your machine, and sure enough powder solves that with a convenient command called `powder host`. This will add all your Pow application domain names to your system's host file, which is where your system ends up looking when no Domain Name Server (or DNS) is available on the Internet. And now you can use Pow on your next plane ride!

### [Pry](pry.github.com)

Debugging is something many people coming from Integrated Development Environments (IDEs) worry about when coming into the Rails ecosystem. Setting break points to inspect code at a specific point within a program is a common and very straightforward way of figuring out why something isn't working the way you expect it to.

Sadly the most popular debugging tool for Ruby and Rails, ruby-debug19, hasn't been updated since 2009. An eternity for a vibrant open source community like Rails.

Pry offers a slightly different approach to debugging by offering an interface similar to the classical Unix command line. When stepping through a program frozen by a break point, Pry lets you `cd` into objects and classes to inspect their properties and methods the way you would inside of a directory structure. It's literarly like code spelunking, which somehow makes debugging a more concrete experience.

Pry has several other great features that for instance allow you to jump the line of source code your currently debugging within your favorite editor to fix a bug in place. It also has several extensions like:

* [pry-nav](https://github.com/nixme/pry-nav) which allows you to resume execution your program line by line and even step backwards
* [pry-stack_explorer](https://github.com/pry/pry-stack_explorer) which lets you climb inside the call stack, examine the state of each *frame* of the stack and even evaluate code in there.
* [pry-remote](https://github.com/mon-ouie/pry-remote) goes hand in hand with Pow since unlike the traditional Webrick or Thin web servers launched through the `rails server` command, you can't add a breakpoint and interact directly with Pry when using Pow since it's running remotely. Pry Remote offers you a new `binding.remote_pry` statement that will interrupt the execution of the Pow server and wait for a client to connect to the debugging session. You'll then just have to run `pry-remote` from any command line on your system and you will be taken into the usual Pry session, minus the pretty colors.

You can find more great information about the [Pry Ecosystem in this excellent blog post](http://banisterfiend.wordpress.com/2012/02/14/the-pry-ecosystem/).

### [Bundler](http://gembundler.com/)

Hard to overstate how amazing Bundler has made working with myriads of gems with different version dependencies inside of an application. This used to be hell for developers, hence the usefulness of segragated Gemsets through RVM.

Thankfully Bundler offers the `bundle exec` command which will run whatever command you pass it `bundle exec rake db:migrate` for instance with the version of rake it resolved as compatible with the Gems declared in your Gemfile. 

It's a bit complex to understand. To summerize, you may have installed and activated version 0.9.2.2 while your Gemfile.lock -- the file Bundler creates once it has resolved all the cross-dependencies of all the Gem versions in your Gemfile -- requires version 0.9.1 to be used. Since you don't have version 0.9.1 anymore -- you've upgraded -- you need to tell Bundler to point to rake 0.9.1 instead, which it does through `bundle exec rake`. 

You can verify that by running `rake --version` and `bundle exec rake --version` in a project whose Gemfile requires an older version of rake. The two versions should be different.

#### Semantic Versioning & Loose Version Dependency

Semantic Versioning is a concept that tries to hold developers to meaningful versioning of their software.

A major version (1.0.0, 2.0.0) should be expected to introduce major non-backward compatible changes. A minor version (1.1.0, 2.1.0) should be expected to introduce minor non-backward compatible changes. And finally, a patch version (1.1.1, 2.0.1) should only contain backward compatible bug fixes.

This is a simplified explanation of the more nuanced explanations and rules covered at [semver.org](http://semver.org/) but it should give you an idea.

Now loose version dependency is a practice whereby declaring gem dependencies in your Gemfile, you don't specify a safer specific version (`gem "rails", "3.2.2"`), or a much more dangerous minimal version (`gem "rails", ">=3.2.2"`) but instead make the version dependency loose: `gem "rails", "~> 3.2.2"`.

With this notation. Bundler will automatically try to update the Rails gem if it finds a newer version than 3.2.2 but will never upgrade to version 3.3.0, which would be a more unpredictable non-backward compatible minor version bump by the definition of semantic versioning. This notation only tries to update the latest number declared, so the much less safe `gem "rails", "~>3.2"` can also be used, but isn't recommended.

## More Tools

That's about it for this long foray into the constellation of open source tools available for Rails development. Here are a few excellent resources available to find more:

* [ruby-toolbox.com](http://ruby-toolbox.com) 
* [rubygems.com](http://rubygems.com) 
* [railscasts.com](http://railscasts.com)

And if you're a [Code School](http://codeschool.com) subscriber, we regularly release [Code TV screencasts](http://codeschool.com/code_tv) on various useful tools and libraries for Ruby and Rails development, I can't recommend them enough.