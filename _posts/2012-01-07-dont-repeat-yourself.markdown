---
layout: post
title: "Don't Repeat Yourself"
date: 2012-01-07 00:34
comments: true
categories: programming
---

## Humble HTML beginings

One my first website ever, which I built in 1999 with Microsoft Front Page, I decided to have on the left side a menu that listed each page. There's a good chance my brain is constructing this memory but I think that the first time around I only had two or three pages, so I simply copied and pasted the same list of links on each.

It surely looked like this abberation:

```html 
<P><A HREF=page1.htm>- Page 1</A><BR><BR>
<A HREF=page2.htm>- Page 2</A><BR><BR>
<A HREF=page3.htm>- Page 3</A><BR><BR>
</P>
```

This is atrocious code, please don't ever use this.

Then after I had organized everything _so neatly_ I thought about adding a fourth page. Boy, the agony. Imagine that. I had to open every single one of those (three) files and add a new link to `<A HREF=page4.html>-Page 4</A><BR><BR>`. With my then collosal experience in web mastery, I could not stand for this. I had to find a way to make this more efficient.

- - -
Oh, hi! This is a reality break. 
_Efficiency_ as described in the paragraph above is nothing else than pure and utter laziness. There's no way around it. But you know what? Laziness is the mother of all invention. If less people settled for repetitive crap, you can bet we would already have our flying cars. So don't settle, you're making me wait for the future, and I don't like that.
- - -

So, back to efficiency. How do you achieve that kind of feat in [HTML 4.01](http://en.wikipedia.org/wiki/HTML) when [Internet Explorer 5](http://en.wikipedia.org/wiki/Internet_Explorer_5) was on the cutting edge of browser technology?

```html
<FRAMESET ROWS="15%,*">
   <FRAME SRC="title.html" NAME=TITLE SCROLLING=NO>

   <FRAMESET COLS="20%,80%">
      <FRAME SRC="menu.html" NAME=SIDEBAR>
      <FRAME SRC="page1.html" NAME=MAIN>
   </FRAMESET>
</FRAMESET>
```

You guessed it! Frames!
Perfect. Until you actually open than in a browser.

{% img center /images/frames.gif Grey Scroillbars are FUN %}

Even for my highly tolerant (I used Papyrus and thought it looked _awesome_) 1999 self, this kind of thing was just too ugly to live. So I tried to find a better way.

## Server-side seduction

I didn't have any idea at the time, but it turns out my ideal solution involved using the _server_. Something I had never heard of outside of a restaurant. I could ask my little server guy to include the menu page of my site for me everywhere I wanted it and it could do it by simply injecting the content of the `menu.html` file wherever I put the following code:

```html
<!--#include virtual="header.html" -->
```

I then needed to rename all of my existing pages to a `.shtml` extension for this decidedly not so smart server to understand that I wanted what looks like an HTML comment to act like an order: "Include this file right here, Mr Server man. No, I will not tip you, you didn't bring me any food.".

I soon discovered a thing know as [PHP](http://php.net/) could allow me to do a lot more nifty things like this if I found a server which knew whatever that acronym meant and enjoyed bad phpuns about [elephants](http://www.google.com/search?q=elephpant).

So now I could do things like:

```php Ooh, look at me, I'm fancy!
<?php require("menu.html") ?>
```

That little trick would reward me with a nasty error if by any chance my menu.html file was missing and stop loading my page altogether until the issue was addressed and all was right again in the world. And that was about the extent of my PHP knowledge for several months after that. I remember seeing `echo()` statements here and there and a few [MySQL query](http://php.net/manual/en/function.mysql-query.php) examples but I didn't get into fiddling with server-side programming until a few months and years later when I found a guy crazy enough to build a back-end system for one of my websites.

## Stay hungry, stay DRY.

That's the end of that trip down memory lane but I want to underline the interesting part here. Despite a total lack of technical knowledge, it's my laziness and drive for efficiency that eventually led me down the slow path of acquiring enough skills to repeating myself less with websites, eventually evolving to dynamic websites, discussion boards, and database storage.

Between this first bit of awful HTML code and now, there are 13 years of tinkering, curiosity, foolish explorations and long night of frustration and pleasure. So the next time you find yourself doing a repetitive task, stop for a moment and explore the web to see if you can find a way to do it the smarter way. You might end up a Web Developer a few years down the line, or you might simply save yourself a good chunk of time and learn some cool things along the way.
