---
layout: post
title: "Staying Sober with Homebrew"
date: 2014-02-07 17:00
categories: development
draft: true
---

[Homebrew](http://brew.sh/) is fantastic. If you're doing any web development, programming, video work — basically anything cool — with your Mac machine, you owe it to yourself to use Homebrew instead of:

- using installers (DMGs) for things like Git because you can't upgrade without going out to download a whole new installer (maybe) and that's just plain tedious.
- compiling binaries from source (if you don't understand, don't worry, Homebrew does that for you) because if you wanted to do that you'd be using Linux, and even then not really.
- using MacPorts which served the same purpose but is less used today for diverse reasons.

## What is Homebrew?

Homebrew is a package manager. Think of it like the Mac App Store, except everything is free (and open source). Instead of apps with graphical user interfaces (GUIs), it allows you to install and upgrade command line executables, often referred to as "binaries" (which is why they're installed in directories called `bin`) because when you compile human-readable source code it becomes machine-readable binary code (0s and 1s).

## Why do you need it?
Why do you need command line executables? Well say you want to start making web applications using Ruby on Rails. There's a good chance someome will tell you to install:

- git (to version control your files)
- PostgreSQL (to replace the default SQLite database Rails uses)
- maybe rbenv & ruby-build to install and switch Ruby versions easily
- pretty much [anything you can think of](http://braumeister.org/)

