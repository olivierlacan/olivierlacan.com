---
layout: post
title: "Use the Ruby, Luke."
date: 2015-12-23 11:00
location: "Paris, France"
categories: development
draft: true
---

You'll often hear people mention that code they've reviewed is not "idiomatic
Ruby". It's a term that has bothered me for years. I come from a linguistic
background which makes me immediately suspect that people who use phrases like
this haven't stopped to think about the semantics at play in the phrase.

> **idiomatic** (adjective)
> 1. using, containing, or denoting expressions that are natural to a native
     speaker: distinctive idiomatic dialogue.
> 2. appropriate to the style of art or music associated with a particular
     period, individual, or group: a short Bach piece containing lots of
     idiomatic motifs.

Do you know a great many *native* Ruby speakers? How does one discover what is
*appropriately* matching the style of Ruby. What style? Should we pretend that
there is **one** Ruby style? Surely not because there is a clear divide between
[Seattle-style](https://github.com/everydayhero/styleguide/blob/410131b2e08b878a348be583481088cba49ff9e6/Ruby.md#syntax)
Ruby (no parens on method definitions) and ~~sane-style Ruby~~ other styles.

So how do you discover what "feels native"? By going native.

It wasn't until I decided that any question about a gem should result either
 `bundle open <gemname>` or `gem open <gemname>` that I finally started
 understanding what "native Ruby" *feels* like. I don't think it's fair to list
 hard rules because what is idiomatic today may not be tomorrow.

 When Rubyists as a community discover that certain style practices are
 counter-productive, it's likely that the loose definition of idiomatic Ruby
 will evolve. The only way to stay fluent in any language is to read it and
 write it with native speakers. Yet, as beginners and intermediate-level
 Rubyists, it's very easy to convince yourself that you need to write more than
 read. And that to me, is what makes it so difficult to grasp what *feels*
 natural.

 You can't develop an intuition for appropriateness until you've
 gathered a sufficient body of understanding. That means reading buffers of
 Ruby code written in many different contexts by people trying to achieve many
 different goals. Pair programming with two people of unequal experience is so
 valuable because as with human languages it's when you struggle to explain the
 quirks that you start to truly be attentive to what makes a language different.
 As someone less experienced, you benefit from a much more accurate feedback
 loop than your own individual practice.

 Now let's wrap it up with an example. Today I happened upon this code in a
 really old Code School controller spec for an API endpoint:

 ```ruby
  it "should respond with the correct json" do
    response_json = HashWithIndifferentAccess.new JSON.parse(response.body)

    response_json[:achievement].should_not be_nil

    achievement_json = response_json[:achievement]

    achievement_json[:api_name].should == achievement.api_name
    achievement_json[:description].should == achievement.description
    achievement_json[:large_badge].should_not be_nil
    achievement_json[:small_badge].should_not be_nil
    achievement_json[:name].should == achievement.name
  end
 ```

Blame RSpec if you will, but this code doesn't feel very "idiomatic" to me.
That said, I used to write code like this. Then one day, after writting one too
many request or controller specs for an API, my frustration at the inadequacy
of Hash comparison tools in Ruby started rising ([frustration](http://olivierlacan.com/posts/proposal-for-a-better-ruby-hash-include/) which was recently [resolved](http://olivierlacan.com/posts/hash-comparison-in-ruby-2-3/))
and I typed what I wished Ruby would let me do. It looked a little bit like this:


 ```ruby
 it "responds with the correct json" do
  response = JSON.parse(response.body)

  expect(response).to include({
    api_name: achievement.api_name
    description: achievement.description
    large_badge:
    small_badge:
    name: achievement.name
  })

  response_json[:achievement].should_not be_nil

  achievement_json = response_json[:achievement]

  achievement_json[:api_name].should == achievement.api_name
  achievement_json[:description].should == achievement.description
  achievement_json[:large_badge].should_not be_nil
  achievement_json[:small_badge].should_not be_nil
  achievement_json[:name].should == achievement.name
 end
 ```
