---
layout: post
title: "Rails Eager Loading vs. Auto Loading"
date: 2016-08-14 13:41
location: "Val Morin, Québec, Canada"
categories: development
draft: true
---

Do you add non-standard paths to the Rails load path? Something like the `lib/` 
directory for things that don't quite fit in with the core business logic. Maybe 
you put a few candidates for gem extraction in there?

Are you running an older version of Rails (prior to 5)?

Do you know the difference between `config.autoload_paths` and 
`config.eager_load_paths`? 

Robert Pankowecki wrote [a very interesting post][arkency] on Arkency's 
(excellent) blog a few years ago on this topic. In it he explains the key 
differences between the two load path arrays.

- `autoload_paths` adds your extra directories to Ruby's `$LOAD_PATH` but 
doesn't execute the bodies of the classes and modules so that the constants 
defined within them respond false to `defined? ClassName`.
- `eager_load_paths` also adds your etra directories to Ruby's `$LOAD_PATH` 
and it **does** execute the bodies of the classes and modules therein in order 
to save you from the small overhead of having to execute the class and module 
bodies in order to load them into memory.

What's the difference you say? 

On codeschool.com, under mild load we went from a 60ms average server response 
time (with about 35ms spent in Ruby) to a 50ms average server response 
time (with about 30ms spent in Ruby). 10 miliseconds. Small change, right? Well,
not in my mind considering this optimization only has a production app server 
boot time cost. 

We do zero downtime deploys with Phusion Passenger, so we don't really care how 
much longer the app servers take to boot if it's going to save our users time 
on average. Yes, I know averages lie, but I'll believe in that lie if it brings 
me a 10ms average dip.

[thoughtbot]: http://blog.arkency.com/2014/11/dont-forget-about-eager-load-when-extending-autoload/
