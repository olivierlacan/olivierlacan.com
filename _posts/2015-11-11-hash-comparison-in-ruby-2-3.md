---
layout: post
title: "Hash Comparison in Ruby 2.3"
date: 2015-11-11 18:00
update: 2015-11-18 17:14
categories:
  - ruby
  - development
editors:
  - Elizabeth Mills: "#"
  - Erik Michaels-Ober: "https://twitter.com/sferik"
---

Update (November 18th, 2015): Since these new methods have been announced a few
people have expressed concerns that they would interfere with `Hash#sort`. I
addressed those concerns in an addendum to this post below.

It's been over a year since I wrote my initial ["Proposal for a better Ruby Hash#include?"](/posts/proposal-for-a-better-ruby-hash-include/)
and I'm so happy to announce that since Tuesday November 10, 2015, Hash comparison
methods have been [committed to MRI's trunk branch](https://github.com/ruby/ruby/commit/d68c3ecf98bf3b5802a6b0f9a6bcf7825addd9e5)
by the fabulous [Nobuyoshi Nakada](https://github.com/nobu).

This means the following Hash comparison methods will be available in Ruby 2.3
when it's released this coming Christmas. In the meantime you can [install Ruby 2.3.0-preview1](https://gist.github.com/nurse/f95ead4fc08b5a454e12)
which was released today and already includes this new feature.

## Comparing Hashes

What is hash comparison? This may be hard to visualize, so here's a short example:

```ruby
hash_one = { a: 1 }
hash_two = { a: 1, b: 2 }
```

It's clear just by looking at `hash_two` that it includes the same single
key and value as `hash_one` plus one extra key and value. So how do you check
that with Ruby? Intuitively you may try the [`Hash#include?`](http://docs.ruby-lang.org/en/2.2.0/Hash.html#method-i-include-3F)
method, right? Let's see.

```ruby
# Ruby MRI 2.2 and earlier
{ a: 1, b: 2 }.include?({ a: 1 })
=> false
```

Hmmm. Strange, no? Well that's because `Hash#include?` doesn't compare hashes, it
only looks at the keys. Worse, it will only work properly with keys as arguments.
So in Ruby 2.2 and earlier, the only thing you
can do is check that a hash includes the same key, like this:

```ruby
# Ruby MRI 2.2 and earlier
{ a: 1, b: 2 }.include?(:a)
=> true
```

This is because `Hash#include?` is in fact a method alias for [`Hash#has_key?`](http://docs.ruby-lang.org/en/2.2.0/Hash.html#method-i-has_key-3F).

This is surprising behavior to say the least, and some Ruby libraries like RSpec
implement [their own Hash inclusion logic](https://github.com/rspec/rspec-expectations/blob/bb731e29f7800f5cef736cf8850293276a0d3f90/lib/rspec/matchers/built_in/include.rb#L94-L97) to circumvent the strange behavior of Hash#include?. As you'd expect,
RSpec's `include` matcher checks hashes for both key **and** value matching. So
you can write:

```ruby
# RSpec
expect({ a: 1, b: 2 }).to include({ a: 1 })
```

## Hash Comparison Methods

My original feature proposal suggested introducing an new `Hash#contain?` method,
but the semantics didn't work well enough for the Ruby core developers. Matz himself
said the following in the November developer meeting:

> Hash#contain? has [a] slight ambiguity problem. I'd vote for adding >=, along with <=.

At first I was a little taken aback by Matz's proposal, but [Erik Michaels-Ober](https://twitter.com/sferik)
pointed out that I should be happy my little method proposal was becoming an
operator on Hashes. And now I see, Matz and Erik were right, look how great this is:

```ruby
# Ruby MRI 2.3.0 (trunk)
{ a: 1, b: 2 } >= { a: 1 }
=> true
```

For the less mathy people (like me), this may take a second to wrap your head
around. I find it easier to say the operator out loud:

> "Is this hash greater than or equal to this other hash?".

A hash that contains another smaller hash is greater, so this returns true.
A hash that contains the same hash is equal, so this returns true.

Here are a few more examples provided by Akira Tanaka:

```ruby
# Ruby MRI 2.3.0 (trunk)
{ a: 1 } <= { a: 1 } = true
{ a: 1 } <= { a: 2 } = false
{ a: 2 } <= { a: 1 } = false
{ a: 2 } <= { a: 2 } = true
{ a: 1 } >= { a: 1 } = true
{ a: 1 } >= { a: 2 } = false
{ a: 2 } >= { a: 1 } = false
{ a: 2 } >= { a: 2 } = true
{ a: 1 } <  { a: 1 } = false
{ a: 1 } <  { a: 2 } = false
{ a: 2 } <  { a: 1 } = false
{ a: 2 } <  { a: 2 } = false
{ a: 1 } >  { a: 1 } = false
{ a: 1 } >  { a: 2 } = false
{ a: 2 } >  { a: 1 } = false
{ a: 2 } >  { a: 2 } = false
{ a: 1 } == { a: 1 } = true
{ a: 1 } == { a: 2 } = false
```

Look at how consistent this is. You can now compare hashes exactly the same way
you would compare integers.

I can't wait for Ruby 2.3.

## Does it mean Comparable is now included in Hash?

No.

The methods added to Hash are as follows:

- `Hash#>` — this hash instance includes the argument hash
- `Hash#>=` — this hash instance includes or is the same as the argument hash
- `Hash#<` — this hash instance is included in the argument hash
- `Hash<=` - this hash instance is included or the same as the argument hash

Conspicuously absent is the `<=>` method used by the Comparable module to sort
objects. What this means is that these new methods will not interfere with your
existing calls to `Hash#sort`.
