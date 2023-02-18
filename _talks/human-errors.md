---
layout: talk
date: 2017-11-30 4:48
title: Human Errors
categories: talk
venue: RubyConf 2017
---
Runtime errors can sometimes turn into dark and unpleasant journeys which lead you to question the nature of reality. Thankfully, Ruby often provides friendly feedback for understanding the cause and remedy for exceptions. Yet, there are situations in which programmers don't receive clear enough context for what really caused an exception and how to address it. We'll look at Ruby's error feedback mechanisms and search for constructive ways in which they can be made more helpful to humans.

### Video

<iframe width="560" height="315" src="//www.youtube.com/embed/eASsqQsaNOA" frameborder="0" allowfullscreen></iframe>

### Slides

<script async class="speakerdeck-embed" data-id="92b55fe4a2b440ce851035848e749c71" data-ratio="1.77777777777778" src="//speakerdeck.com/assets/embed.js"></script>

### Abstract

Runtime errors can sometimes turn into dark and unpleasant journeys which lead you to question the nature of reality. Thankfully, Ruby often provides friendly feedback for understanding the cause and remedy for exceptions. Yet, there are situations in which programmers don't receive clear enough context for what really caused an exception and how to address it. We'll look at Ruby's error feedback mechanisms and search for constructive ways in which they can be made more helpful to humans.

#### Details

Whether you're a beginner or a seasoned Ruby developer it's a given that you encounter exceptions of some kind every single day. Many of them are caused by simple mistakes that can be easily fixed assuming you have the proper context and understand the cause of the exception.

As a programming language that focuses on happiness, Ruby has done a good job of supporting developers in their constant struggle against exceptions. However in recent years, languages like Elm, Rust, Kotlin, Go, and Elixir have set a higher standard for the quality of feedback given to programmers in exceptional situations.

In this talk we will look at existing ways in which Ruby offers useful feedback on exceptions to programmers but also ways in which Ruby's feedback mechanisms can be improved by taking inspiration from other languages in order to make Ruby developers happier and more productive.

At first I will describe the problem by showcasing hopefully familiar situations in which Ruby is less than useful with exception feedback. A good first example is ArgumentError which can give confusing feedback when a method requiring keyword arguments is given regular arguments by complaining that it somehow expected 0 arguments.

I will show how confusing or inappropriate feedback often creeps in the fringes of a language like Ruby or manifest itself when new features are added and have unexpected interactions with existing feedback mechanisms.

I will take the opportunity for a quick dive into how Ruby provides feedback to programmers in the first place to demonstrate the fact that despite lacking C knowledge, it's quite possible for someone to contribute improvements to such mechanisms.

To show how far Ruby has progressed in recent years I will use examples like the did_you_mean gem which is now part of Ruby itself since 2.3 and has significantly improved the NameError exception by providing a list of variables or methods similar to the one invoked when it can't be found.

Finally, after having presented the problem space, offered ways to contribute fixes, and example of recent successful improvements, I will delve into other modern programming language with interesting or different error feedback mechanisms which could serve as inspiration to attendees so they can be a part of the future of Ruby.
