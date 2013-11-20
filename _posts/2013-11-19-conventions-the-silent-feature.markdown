---
layout: post
title: "Conventions: the silent feature"
date: 2013-11-19 21:00
draft: true
---
In the Rails world, it seems to be a truth universally acknowledged that [convention over configuration](http://en.wikipedia.org/wiki/Convention_over_configuration) is a great philosophy. 

> "I think empty folders and empty files are two of the pivotal innovations in Rails that have encouraged us to write clean applications since the framework appeared." — David Heinemeier Hansson during his [Keynote at RailsConf 2011](http://www.rubyinside.com/dhh-keynote-streaming-live-from-railsconf-2011-right-here-right-now-4769.html)

Empty files and folders, isn't that just clutter? If the files cause your application to load more slowly (because Rails needs to load them all) then yes, maybe it's a good idea to get rid of the empty files.

The empty folders, however, are a gift that keeps on giving. They invite all developers who use Rails to organize their codebases in the same fashion. They ensure that you can:

- look in `test/` for tests
- expect application-specific CSS files to be `app/assets/stylesheets` for any application CSS files
- search in `app/assets/javascripts` for any JavaScript or CoffeeScript code
- etc.

I was reminded of the value of these folders this week as I started updating 35 of our Code School Rails apps to add a third-party JavaScript library. All I had to do was drop a JavaScript file in `vendor/assets/javascripts`. Semantically the location of the file implies that the code is not application-specific and from a third-party, I don't need to document that in any other fashion. 

Thanks to the often derided (deservedly so) Asset Pipeline, I can be confident this new file will be added to the load path and available for me to require inside of `app/assets/javascripts/application.js` (or equivalent CoffeeScript files).

One of my favorite of Apple's Macbooks is their Magsafe power brick. Not the fancy magnetic connector that snaps out when the power is yanked to prevent the computer to be hurled towards the ground. That is actually a sexy feature whose value proposition is quite obvious to most customers. No, what I really love is the brick itself, it's an often overlooked work of product design genius.

![Apple Magsafe 1 Power Adapter](http://link.olivierlacan.com/image/1C1K2E2L3E1o/Screen%20Shot%202013-11-19%20at%208.49.25%20PM.png)
*Apple Magsafe Power Adapter*

First, this custom-designed power brick is beautiful. Unlike most other laptop manufacturers, Apple didn't pick one of the gigantic off the shelf generic power adapters out there. You could be cynical and see that ploy for Apple to sell non-standard plugs. Sure. they're non-standard. But when the standard sucks, why tolerate it when your goal is to offer a better product?

![Sony Vaio Power Adapter](http://f.cl.ly/items/330D3B1m1A3O281j2f3A/49198105.jpg)
*Sony Vaio Power Adapter*
 
Second, look at the prongs sticking out of the brick. In North America, these are foldable, which allows the brick to become a perfect square. That's a dream when traveling light as you can fit this power adapter in the smallest bags (or purses).

Third, the reason you see a line separating the actual prongs and the rest of the power adapter body is because the module is removable. By sliding it out you can swap it for a longer extension cord in case you're sitting in a coffee shop with a distant power outlet. Better yet, this means that the body of the adapter is universal, it can be used anywhere in the world as long as you swap the proper plug piece for the region you're travelling to. And of course Apple sells an [Apple World Travel Adapter Kit](http://store.apple.com/us/product/MB974ZM/B/apple-world-travel-adapter-kit) to deal with that. 

Last, and defnitely not least, the sides of the brick have little retracktable arms you can pull out to neatly fold the cable that connects directly to your laptop. At the end of that cable, a small plastic holder allows you to secure the loose end of your cable. 

Regardless of wattage requirements necessary for different laptops, every single power adapter Apple ships behaves the same way, even some of the tiny power bricks that ship with the iPad and come with a USB cable instead. This is an amazing convention that keeps on delivering value to users, and I can't remember a recent time where Apple touted it in their marketing material.