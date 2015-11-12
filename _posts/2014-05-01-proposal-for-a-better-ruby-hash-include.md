---
layout: post
title: "Proposal for a better Ruby Hash#include?"
date: 2014-05-01 1:53
update: 2015-08-18 12:37
categories: development
---

## The Use Case
Earlier I was writing a test to ensure that a Hash contains a specific key and value.

```ruby
it "sets the anonymous key to true" do
  expect(properties).to include { a: true }
end
```

It then dawned on me that this kind of comparison, while possible in the RSpec
DSL with its built-in matchers[^1] was actually impossible in raw Ruby.

Take a Hash:

```ruby
x = { a: true, b: false }
```

Now take another Hash:
```ruby
y = { a: true }
```

You want to check whether `y` is included within `x` or not. So what's the first
thing that comes to mind? For me, it's `String#include?`, which works like this:

```ruby
"Olivier".include?("Oli")
# => true
```

This is probably one of the most famous whoa-worthy Ruby demonstrations when
someone wants to show the object-oriented power of the language. So naturally,
when I'm dealing the `x` and `y` hashes above, I reach for `include?`:

```ruby
x.include?(y)
# => false
```

Well, obviously that's not (pardon incoming pun) true! Let's look at the [Ruby API
docs to see how `Hash#include?` is defined](http://www.ruby-doc.org/core-2.1.1/Hash.html#method-i-include-3F):

> include?(key) → true or false
> Returns true if the given key is present in hsh.

```ruby
h = { "a" => 100, "b" => 200 }
h.has_key?("a")   #=> true
h.has_key?("z")   #=> false
```

If this leaves you puzzled, I can empathize. The fact that the example isn't
even using `include?` shows that it's used as a method alias for `Hash#has_key?`
which does have a good name. `Hash#include?` however, is very poorly named because
it breaks a reasonable expectation.

You cannot say that `Hash#include?` is checking whether something "is included
in the Hash instance" because this method only checks keys. If it were checking
both the keys **and** the values then perhaps this would make sense.

## The Basic Implementation
So here's my proposition for a reasonable and simple re-implementation[^2] of `Hash#include?`:

```ruby
class Hash
  def include?(other)
    self.merge(other) == self
  end
end
```

It seems incredibly simple but by that token, why not offer such a useful
method to Ruby developers instead? It seems silly to monkey patch the Hash class
for something like this when it could benefit all Ruby developers to have in Ruby core.

## Demonstration

And here's a demonstration of it in use:

```ruby
{ a: true, b: false }.include?({ a: true})
# => true

{ a: true, b: false }.include?({ b: false})
# => true

{ a: true, b: false }.include?({ a: false})
# => false

{ a: true, b: false }.include?({ c: true})
# => false
```

I'm was thinking about submitting this implementation to the Ruby core team to see if
they would consider including it in a major version of the language. Obviously,
this would be an API breaking change since all existing programs using the current
implementation of `Hash.include?` would suddenly stop working properly.

A way to alleviate that concern would be to use another method name than `include`
which I don't think is a good idea. That said, I could be convinced that
`Hash#contain?` could be a suitable alternative. This name would prevent an API
breaking change and could potentially allow this method to be shipped with Ruby 2.2.

What surprises me is that the very
[definition of the equivalent `Array#include?`](http://www.ruby-doc.org/core-2.1.1/Array.html#method-i-include-3F)
is hinting at what `Hash.include?` should be:

> Returns true if the given object is present in self (that is, if any element == object), otherwise returns false.

And with that, I rest my case.

I'd like to thank [Jim Gay](http://www.saturnflyer.com/), [Pat Shaughnessy](http://patshaughnessy.net/)
and [Terence Lee](http://hone.heroku.com/) for their feedback and support. I'll
submitting a [feature request](https://bugs.ruby-lang.org/projects/ruby-trunk) for
Ruby 2.2 shortly unless someone can find a reason for me not to.

## Update 1 (August 28th, 2014)
Some time has passed since this post and shortly after Nobu — the amazing
Ruby core team member known as "Patch Monster" — [created a patch that
actually implements this proposal](https://gist.github.com/nobu/dfe8ba14a48fc949f2ed), albeit with name I find confusing.

After talking with some Ruby developers, including Adam Rensel who works with
me at Code School and also often has the need to check whether a Hash is
partially or completely included in an other Hash, I settled on a better
name for this method: `Hash#contain?(Hash)`

I know I said I would be submitting a feature suggestion to Ruby Core
and sadly I haven't done that yet because I wanted to make sure that this
wasn't frivolous. But I swear I'll do it before RubyConf 2014.

To be honest I wish we could extend the capabilities of `Hash#include?`
because [its current implementation](http://www.ruby-doc.org/core-2.1.1/Hash.html#method-i-include-3F)
seems woefully simplistic. It's a mere alias to `Hash#has_key?` which is
inconsistent with the meaning of "include" in my book. I believe that if
`Hash#include?` (a real one, not an alias) receives a Hash, it should do
*actually* compare the two hashes (both keys and values). If it receives
a String or a Symbol, it should defer to `Hash#has_key?`.

## Update 2 (March 19th, 2015)

After a busy end of 2014 I finally found the time to submit [a proper feature
proposal to bugs.ruby-lang.org](https://bugs.ruby-lang.org/issues/10984).

The feature is being debated with fellow Rubyists at the moment.

## Update 3 (November 9th, 2015)

After some stagnation, the feature proposal was discussed in two separate Ruby
core team developer meetings. First on [May 14th, 2015](https://bugs.ruby-lang.org/projects/ruby/wiki/DevelopersMeeting20150514Japan)
and then [this morning for the November meeting](https://docs.google.com/document/d/1D0Eo5N7NE_unIySOKG9lVj_eyXf66BQPM4PKp7NvMyQ/edit#heading=h.bnqkvf9ajejv). Matz said he favored a comparison operator (`<=` or `>=`) because
it's less ambiguous than `contain?`.

This means that the syntax I originally proposed would evolve to something like
this:

```ruby
{ a: 1, b: 2 } >=  { b: 2 }
=> true
{ b: 2 } <=  { a: 1, b: 2 }
=> true

# also
{ b: 2 } >=  { b: 2 }
=> true
{ a: 1 } >=  { b: 2 }
=> false

{ b: 2 } <=  { b: 2 }
=> true
{ b: 2 } <=  { a: 1 }
=> false
```

I have to admit I was originally surprised by Matz' proposal (it was early) but
I've since then been convinced by its versatility and simplicity. I really hope
it can be included in Ruby 2.3 for the December 25th release. That would be quite
the Chritmas present. :-) 

[^1]: You can see how this include matcher is implemented in the [rspec-expectations source](https://github.com/rspec/rspec-expectations/blob/bb731e29f7800f5cef736cf8850293276a0d3f90/lib/rspec/matchers/built_in/include.rb#L94-L97).

[^2]: I'm using [`Hash#merge`](http://www.ruby-doc.org/core-2.1.1/Hash.html#method-i-merge) for convenience and as a hack. I don't know if it's appropriate or performant enough.
