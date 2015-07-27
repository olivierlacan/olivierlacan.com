---
layout: post
title: "Better Feedback on Ruby 2.2 Keyword Argument Errors"
date: 2015-03-30 19:21
location: "Paris, France"
categories: ruby
---

I was building a class yesterday and I wanted the instantiation process of the class
to be self-documenting so I decided to use a keyword argument in the `initializer` method.

```ruby
class HallMonitor
  def initialize(user: nil)
    @user = user
  end
end
```

As you can see, I also decided to make the `user` keyword argument optional by
making it default to nil.

Later while pairing and refactoring the implementation of the class and the
associated specs, I forgot about my fancy keyword argument and simply wrote
the following:

```ruby
HallMonitor.new(user)
```

This raised the following error:

```ruby
ArgumentError: wrong number of arguments (1 for 0)
```

I was confused for a second. I hesitated, then said "it makes no sense" out loud
because I remembered making the `user` argument optional. Of course I had misread
the exception as "wrong number of arguments (**0 for 1**)", which it wasn't.

Then I went back to the class, looked up the method definitation and went "aaaahhh!".

But here, Ruby could have been far more helpful to me. It made sense before we
had keyword arguments for Ruby to respond with an exception that would just compare
the number of provided arguments against the number of required arguments. Nowadays
we have keyword arguments, Ruby can tell us exactly what argument is missing and
what its name is (if we use keyword arguments of course), so why not throw this exception
instead:

```ruby
ArgumentError: wrong number of arguments (1 for 0), keyword arguments: [user: nil]
```

This kind of simple error feedback improvements, similar to [one proposed by
Richard Schneeman](https://bugs.ruby-lang.org/issues/10982) earlier this year
would probably save a Rubyists time debugging simple mistakes. And that's bound
to make them happier, isn't it?

If you agree or disagree, let me know on [Twitter](http://twitter.com/olivierlacan) or by
email. I'll submit a feature suggestion to [bugs.ruby-lang.org](http://bugs.ruby-lang.org)
if nobody objects for a sensible reason.
