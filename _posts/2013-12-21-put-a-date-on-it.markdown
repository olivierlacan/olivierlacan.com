---
layout: post
title: "Put a Date on It"
date: 2013-12-21 13:30
---

As I sat here tweaking some HTML &amp; CSS on my About page to use a swanky [`<figure>` element](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/figure) that I learned how to properly use from the great [Drew Barontini](https://www.codeschool.com/courses/front-end-formations), I realized it was silly that I had to manually refresh my browser every time. I'm using `jekyll serve --watch` to automatically update the page in the background when any file is updated so I don't have to shut down jekyll server and restart it every time I make a change.

I knew about [LiveReload](http://livereload.com/), an app & browser extension that allows you monitor files and refresh the browser only when needed and I was curious if someone else had used it with Jekyll before so I did a typical Google search: `jekyll livereload`. The first result was a StackOverlow discussion. Generally those are reliable and to the point but I was attracted by the second result, [a personal blog post from Thanasis Polychronakis](http://thanpol.as/jekyll/jekyll-and-livereload-flow/). 

![Screenshot of my "jekyll livereload" google search]({{ site.url }}/images/jekyll-livereload-google-search.png)

Hard to pass on such an amazing name and the title is right on the nose for what I was looking for.

As soon as the page loaded a slight panic started setting in. This is a feeling I'm extremely familiar with because as a software developer, I basically spend 50% of my time researching how to do or fix something on Google (not kidding, expert-level Google searching should be a job requirement). And once in a while, I come across an apparently well written blog post that looks like it's the one — it's going to solve my problem I know it!

**And there's no date anywhere.**

I scroll down all the way to the bottom. *No date.*

Twitter share and follow buttons, *but no date*.

Mostly irrelevant Disqus comments, *but... no date*.

The post title with no by-line should have tipped me off but I was hopeful. This is a technical topic involving fast-evolving software on the web. These things change every single day. A blog post about [Jekyll](http://jekyllrb.com/) written two weeks ago could be obsolete because of [a new release](https://github.com/jekyll/jekyll/releases). Because this — potentially useful — post isn't dated I can't know with confidence that it applies to the same version of Jekyll I'm using.

There's no way to know — at a glance — that this information isn't irrelevant and a dead end.

Yes, I can sift through the Disqus comments at the bottom of the page and try to infer based on their dates when the original publication was, but that's not how it's supposed to go.

A blog post dedicated to a time-sensitive topic should include:
- the title of the blog post
- the full name (or pseudonym) of the author
- the (absolute) date of publication
- the content of the post itself, hopefully with a reference to the version numbers of all mentioned software

It is possible to customize a Google search to only return pages created during a certain time frame — for instance [the last year](https://www.google.com/search?q=jekyll+livereload&oq=jekyll+livereload&aqs=chrome..69i57j0l5.2721j0j1&sourceid=chrome&espv=210&es_sm=91&ie=UTF-8#es_sm=91&espv=210&q=jekyll+livereload&safe=off&tbs=qdr:y) — but this shouldn't be necessary. 

![Screenshot of the Google Search Tools options to select a date range]({{ site.url }}/images/jekyll-livereload-google-search-date-filter.png)

I'm making an example of Thanasis' post (*say that out loud!*) even before I've finished reading it because I think nailing little details like this can help a lot of people, not because I'm trying to nitpick him for trying to help.

So remember, if you're going to publish it, put a date on it. 
