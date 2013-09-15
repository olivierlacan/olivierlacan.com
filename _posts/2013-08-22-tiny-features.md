---
layout: post
title: "Tiny Features"
date: 2013-08-22 09:28
---

Whether you consider yourself a designer, a developer, or a balanced hybrid of both, we all tend to have the mindset of engineers. Every day I work on growing [Code School](http://codeschool.com), a product I care deeply about. Naturally, there's an urge that develops in my brain: I need to find the next great feature. The thing that will delight my users. The well-thought out system that will make them go: "Whoa, I would never have thought of that, but that's exactly what I needed.".

Sadly I have a tendency to become blind to low-hanging fruits. The tiny features that can drastically affect our users' experience but may not involve impressive engineering feats.

Last year I worked on adding the ability for Code School [teams](http://www.codeschool.com/enroll?team=true) to have Managers. No, we weren't trying to introduce middlemen between our team members and their learning. We had been receiving an increasing number of customer support requests from people who worked in companies where developers and designers were using Code School. The people who reached out to us weren't themselves developers or designers but they needed to be able to invite new employees to their Code School team. Perhaps they were in charge of all company expenses and therefore weren't comfortable giving the company's credit card information to another employee.

We hadn't considered this yet. It would have been hard for us to derive a usage pattern from a situation we weren't familiar with within our own team at [Envy Labs](http://envylabs.com). Instead of trying to predict that people would need a feature like this, we reacted when our own paying customers proved to us that it would be worth spending time developing it.

We started working on the feature, and during one our pairing sessions, I decided (and my pair agreed) that it would make sense for people who created a Code School team to not become a playing member of that team. We made it so that they would be offered an easy way to join the team and have access to all our content, which meant using up a paid seat.

I know what you're thinking. It makes no sense because this person just paid for a subscription (which defaults to one paid seat) and they can't access our content until they express the intention to do so. Through a combination of over-focus on the details of the feature, and over-exposure to the customer support data that prompted this feature to be considered, somehow, it made absolute perfect sense to me at the time. I thought it was fucking brilliant.

Except it so very much wasn't. After a few weeks we started receiving complaints from people who had just subscribed to a team account and said they couldn't access our courses when they tried right after subscribing. At first I scoffed with the overconfidence of someone who has come to trust something they contributed to building way too much, and then it hit me. Oh shit, they didn't notice the button and the carefully worded copy that offered them to join their team as a playing member.

"Oh, people", I thought to myself. "Can't be bothered to read an easy little button, huh?". Bullshit! When a user proceeds with an action (subscribing) that involves upfront payment, they except the goods to be given to them as soon as the payment clears. What did I do? I introduced an extra step in that process, in way that would have made Windows Vista proud.

And this is where I get to my point. This is the code that ultimately determined this behavior:

```ruby
if subscription.team?
  ensure_owner_in_members
```

And this is all I had to do to provide a much nicer initial flow to our team customers:

```ruby
if subscription.team?
  ensure_owner_in_members
  ensure_owner_in_managers
```

This was a minuscule feature. I really can't call it a bug fix. There was no bug in here, only intentional behavior, however poorly thought out. Yet, the impact this feature had on our customers wasn't miniscule at all.

PS: I recently asked the [Tender](http://tenderapp.com) team to add a keyboard shortcut (the mighty `Command + Enter`) to submit a comment in their customer discussion interface. Our community manager, [Joseph](http://twitter.com/yooosef), had mentioned to me that he mashes his `Tab` key 5 times in a row and presses `Space` in order to comment & close a support discussion on Tender. It has become muscle memory to him, so it will be hard to remap that behavior to the new `Command + Shift + Enter` shortcut that allows him to do that in a single stroke, but thankfully it will stave off his carpal tunnel syndrome.

Julien, the Tender developer who took care of this, inspired this post with his response when I thanked him in a tweet for the feature:

https://twitter.com/asciithoughts/status/370314878470193152