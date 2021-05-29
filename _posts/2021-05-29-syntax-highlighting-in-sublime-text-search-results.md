---
layout: post
title: "Syntax highlighting in Sublime Text search results"
date: 2021-05-29 17:58
location: "Orlando, Florida"
categories: development
summary: Sublime Text doesn't offer syntax hihglighted search results, but you can fix that
draft: true
---

After suffering through VSCode's bloated interface for many months last 
year because its native support for TypeScript made work projects easier
to deal with, the recent official release of Sublime Text 4 reminded me 
why I've stuck with this wonderful, simple, and fast editor for over a 
decade now. 

But just a few weeks after switching back to Sublime for some tasks, 
I ran into an issue that has been frustrating me for years. While the 
syntax highlighting support in Sublime is excellent and easily extensible
thanks to the native integration of [Will Bond's excellent Package Control][pc],
for some hard to fathom reason, this syntax support doesn't apply 
to search results. So you end up with results that are extremely difficult 
to parse if you happen to be searching for multiple instances of a 
similar string of words in many files: say an import statement, or class 
inheritance.

