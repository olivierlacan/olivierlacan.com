---
layout: post
title: "Proposal for a better Ruby Hash#include?"
date: 2014-05-01 1:53
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

[^1]: You can see how this include matcher is implemented in the [rspec-expectations source](https://github.com/rspec/rspec-expectations/blob/master/lib/rspec/matchers/built_in/include.rb#L71-L74).

[^2]: I'm using [`Hash#merge`](http://www.ruby-doc.org/core-2.1.1/Hash.html#method-i-merge) for convenience and as a hack. I don't know if it's appropriate or performant enough.
