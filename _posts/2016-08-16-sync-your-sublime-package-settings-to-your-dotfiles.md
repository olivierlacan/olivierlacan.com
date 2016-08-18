---
layout: post
title: "Sync your Sublime Package Control Settings to your Dotfiles with Git"
date: 2016-08-16 14:37
location: "Val Morin, Québec, Canada"
categories: development
draft: true
---

Do you use [dotfiles?][dotfiles] Do you hate having to reinstall all your 
Sublime Text packages from scratch ever time you either get a replace your 
work machine or get a brand new one?

The Package Control documentation offers instructions on how to sync your 
all your User settings including your installed Package Control packages. The 
caveat is that they recommend using Dropbox. Dropbox is fine, but it's a 
commercial services that not everyone uses, you may need to pay for (unless 
all you use it for are Sublime Text preference files), and while Dropbox is 
versioned, it's automatically versioned, not purposefully.

I like to version my development-related tools purposefully — with git. When 
I change something, I want to jot down why so that I can remember the context 
for the change. Also, [my dotfiles are public][mydotfiles] so that others can use them or 
be inspired by them. That's much more tedious to do with Dropbox.

## The ~/.dotfiles directory

This is fairly common convention. `~` at least on macOS is shortcut to your 
user's home folder. `cd` and `cd ~` on macOS both will take you to that home 
directory.

My `.dotfiles/` directory is located at the root of this user home folder. I've 
git cloned it with `git clone olivierlacan/dotfiles ~/.dotfiles`. This means 
it's not visible by default (the `.` in front of the directory name makes it 
hidden to the file system by default). You'll need to use `ls -a` 

## Moving the User Directory

z

[dotfiles]: https://dotfiles.github.io/ 
[mydofites]: https://github.com/olivierlacan/dotfiles
