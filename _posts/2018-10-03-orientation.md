---
layout: post
title: "Orientation"
date: 2018-10-03 18:05
location: "Orlando, Florida"
categories: development
draft: true
---
## The Problem

In a small company, something inconvenient can happen to useful information: It
falls in silos. These silos are made up of human beings who hold knowledge that
other people on their team need. Silos can also occur in small pools of
documentation initially meant to house answers (like GitHub wikis, Google Docs,
etc.). But when other people don’t know they exist or where to find them, you’re
left back at square one. So, over the last 3 years at Code School, I’ve set out
to devise a solution to this problem because I noticed we needed information to
flow more freely.

The inefficient method to deal with information we’re missing is the one that
comes most naturally to us — we ask someone who we think holds the answer. It
seems like a fairly reasonable solution until this group of people (your
company) starts growing.

One day, someone asks you a simple question, and you realize you’ve answered
this exact same question about 10 times in the last year — or maybe even in the
last month. And of course I have no problem answering it and helping my fellow
Code Schoolers, but this same scenario is probably repeating all around the
company. People are asking other people about the same information, over and
over again.

Worse, whenever you give someone an answer, they’ll remember that answer. Should
this information ever change, they won’t know about it. You could try to
remember each person you gave an answer to, and one by one tell them, “Actually,
this is how we do refunds right now” each time the process evolves. Or, you
could send a mass email, or use a company-wide notification via instant
messenger, but we all know how everyone loves those. But seriously, there has to
be a better way.

## A Solution

My internal solution for Code School? Orientation, a simple application 
[I’ve now open-sourced][1]. But more importantly, it’s a concept — a way to
reduce our collective time-to-answer.

![Screenshot of the main Orientation interface][2]

The first thing you see when landing on Orientation is a search field. If you
have a pointed question, there’s a good chance you can apply some of those
Googling skills and find an existing article on Orientation that answers your
question.

If you don’t, then there’s obviously an information gap. Your job as the
information seeker is not only to make sure you find an answer, but also to help
the next person who will ask the same question. Chances are that person will be
you, so statistically you’re helping yourself.

![Screenshot of Orientation Search displaying no result and offering to create new article based on the search terms][3]

Now, there’s a good chance you don’t really know the answer to that one. But
when you do track down the resident polar bear expert, you’ll be able to jot
down her response to your question on Orientation and solve this mystery for
everyone else.  

![Screenshot of new article creation interface automatically filling in the search term as the title][4]

People who need to be aware when some information invariably changes can
subscribe to any article on Orientation and receive email notifications when
someone edits an article. This means that not only does information flow more
freely, it also remains linked to the people who need it most.
Information Rots
----------------

There’s another problem I didn’t mention yet — information becomes stale very
quickly. That’s especially true in small companies that evolve quickly.
Processes are upended, and people are hired to solve problems so the documented
solutions become irrelevant. This is why by default (but still configurable),
Orientation will automatically mark an article as stale after 6 months. If you
happen upon a stale article, a choice is presented to you:

![Screenshot of the fresh/rotten article toggle][5]

1.  You can mark the article as Rotten if it’s clearly out of date, and the
contributors will receive an email prompting them to update it. 2.  You can mark
the article as Fresh, signaling it’s still up to date.

Articles only stay Fresh for 7 days — after that the staleness counter starts
ticking again and will eventually help outdated information fade away if no one
in the team can confirm whether it’s still accurate.

## Some People Search, Some People Browse

What we realized eventually is that not everyone searches for information by
thinking of keywords. Take someone who just joined your team. They’ve been
on-boarded, they filled out paperwork, they read your [code of conduct][7],
they know how to get to the secret stash of fruit snacks in case of emergency.
What they don’t have is months of internalized knowledge about “how people do
things here.”

So it’s hard to search for Unknown Unknowns™. And for that, Orientation has
Guides®, which we’ve harnessed the ancient power of [hypertext][8] to create.
Guides are just normal articles that link to other normal articles — the only
difference is they’re featured on the homepage so people who want to browse for
information can. A good example is our Onboarding Guide, where we’ve organized
articles that you may not think of searching for, but they’ll come in handy to
anyone who recently joined our team.

![Screenshot of an Orientation guide showing unordered lists of links to other Orientation articles][6]

Orientation is a solution that, at least for us, has helped immensely with
information silos. The most important takeaway is that, for any company, making
information easy to find and access is crucial to long-term success. Want to
use Orientation for your team? You can find it on [GitHub][1] as a free open
source under the MIT license. And if you’ve experienced these documentation
issues within organizations you’ve worked for, consider contributing to
Orientation yourself.

[1]: https://github.com/olivierlacan/orientation
[2]:
[3]:
[4]:
[5]:
[6]:
[7]: http://www.ashedryden.com/blog/codes-of-conduct-101-faq
[8]: https://en.wikipedia.org/wiki/Hypertext
