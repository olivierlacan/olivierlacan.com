---
layout: post
title: "Composition and Government"
date: 2012-01-28 16:03
comments: true
categories: programming
published: false
---

One of the most interesting things I've discovered when learning how to program was composition. Inheritance is an easy concept to communicate, it's suited to simple metaphors and generally understood well by beginners.

It generally takes a bit more effort to understand the advantages of composition.

For the sake the excercize, let me try to define both.

## Inheritance

Most everyone knows what inheritance means is common parlance. When someone dies, unless they have expressed a different wish in a legally binding way, their positions are transfered to their children or next of kin. For simplicity let's assume that everyone who dies has children. The process is then simple. I have a house and car. I die. You are my daughter. You are now the legal owner of my house and car.

But we're only talking about posessions. What about traits? You know, the color of your eyes, hair and other physical characteristics? Those don't require anyone to kick the bucket to be transfered. There is a high likelihood that someone's children or grand-children are going to _inherit_ their physical traits.

In programming, things are a little less morbid. Inheritance means that a children can do everything its parent can. I know, wouldn't it be nice if children were born with all the physical and intellectual properties of their parents from the get-go? Well, that might be a little creepy actually. And no, technically that wouldn't be a clone, since a DNA clone simply has the same blueprint –- knowledge isn't transfered.

So the examples usually go like this:

```
A Fruit is yummy.
An Apple is a round Fruit.
Therefore an Apple is round AND yummy.
```

## Composition
As a programmer, you define what things are. If you somehow decide that from now on Fruits will be disgusting instead of yummy. Then the Apple can complain all it wants, but it will still become a disgusting round thing.

And who would want that?

That's the issue with inheritance. When you inherit something, you're completely dependent on your parent (that makes for some funny paralells doesn't it?). The reason for this is that unlike human beings, objects in programming can change at the will of the programmer. This dependency of the child (Apple) to the parent (Fruit) is called [_tight coupling_][1].

[1]: http://en.wikipedia.org/wiki/Coupling_(computer_programming) 