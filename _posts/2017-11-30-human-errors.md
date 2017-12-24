---
title: Human Errors
layout: post
date: '2017-11-30 1:11:00'
location: Tulsa, Oklahoma
categories:
  - open source software
draft: true
---
![Title card for Human Errors. Human is light blue. Errors is light red. There is a small red heart next to the word errors with a white X crossing it. ]({{ site.url }}/assets/human_errors_title.png)

*Don't like reading? This post is based on a talk you can [watch here](/talks/human-errors/).*

In the world of software, encountering an error can often turn into a
dark and unpleasant journey which lead you to question the nature of
reality.

As programmers, we're often assisted by programming languages like Ruby
which try to provide friendly feedback to understand the cause of an
exception and its potential remedy.

Yet invariably, there are situations in which software developers (and
unfortunately, their end-users) don't receive clear enough context for
what really caused an exception and how to address it.

Whether you're a beginner or a seasoned software developer it's a given
that you encounter exceptions of some kind every single day. Many of
them are caused by simple mistakes that can be easily fixed assuming you
have the proper context and understand the cause of the exception.

{%
  include image.html
  name="human_errors_context.png"
  alt="Slopped graph of parts separating users from recovery: first context, then feedback."
  caption="When errors are provided without context, or feedback, or both, recovery is much more difficult for programmers and end-users alike."
%}

As a programming language that focuses on happiness, Ruby has done a
good job of supporting developers in their constant struggle against
exceptions. However in recent years, languages like Elm, Rust, and
Elixir have set a higher standard for the quality of feedback given to
programmers in exceptional situations.

{%
  include image.html
  name="human_errors_elm_error.png"
  alt="Example of an Elm recursive type alias error with excellent context and feedback to resolve the issue, including the file location, code block context, and a suggestion for a simple fix."
  caption="Elm provides perhaps the best example of a recent programming language that goes the extra mile to provide as much context and feedback to programmers as possible when errors occur."
%}

## Instant Recovery

In contrast, one of the most useful errors Ruby provides occurs when you
attempt to call a method which doesn't appear to exist on an object but
matches a slightly differently spelled method:

```
irb(main):001:0> expode
NameError: undefined local variable or method `expode' for main:Object
Did you mean?  explode
  from (irb):01
  from /.../2.4.0/bin/irb:01:in `<main>'
```

This was achieved through the inclusion of the [did_you_mean][1] gem in
Ruby 2.3.0 which uses a [Levenshtein distance algorithm][2] to find potential
mispellings. It's a great example of the language implementors using a
relatively simple tool to offer instant recovery from a very common type
of error — mispelling.

But another [very common][nilerr] Ruby exception — `NoMethodError` is
not so great at giving useful context:

```
irb(main):001:0> task.call && target.call
NoMethodError: undefined method `call' for nil:NilClass
  from (irb):01
  from /.../2.3.1/bin/irb:01:in `<main>'
irb(main):012:0>
```

Can you tell which side of this line triggered the exception? Was it
the call on `task` or `target`? While you could figure this out
eventually by commenting out either side or using a debugger breakpoint,
this is something the language, library, or tools should help with.

## Clearer Context

A good example of how to solve this comes from Rust, which will display
back to you the line of code that triggered the exception **and**
highlight the exact portion of that line where the error was caught:

{%
  include image.html
  name="human_errors_rust_error.png"
  alt="Example of a Rust error where a type cannot be found and where the line of code where the error occured is displayed along with highlighting of the specific keyword that triggered the error."
  caption="While it's fairly obvious that `Neuromancy` was the cause of the error here, such highlighting would be very helpful in ambiguous circumstances."
%}

Richard Schneeman submitted a feature suggestion to add similar
contextual feedback to Ruby two years ago now in order to clarify the
location of NoMethodErrors. Yuki Nishijima overrode of
the `NoMethodError` class as a [proof of concept][poc], and it's quite
good:

```
irb(main):043:0> @foo = nil
=> nil
irb(main):044:0> @bar = nil
=> nil
irb(main):045:0> @foo.call && @bar.call
NoMethodError: undefined method `call' for nil:NilClass

  @foo.call && @bar.call
                   ^‾‾‾‾

  from (irb):45
  from /.../2.4.0/bin/irb:11:in `<main>'
```

This improved `NoMethodError` definitely improves the context given but
doesn't go as far as Elm which displays the source code surrounding the
site that triggered the error along with line numbers.

The feedback message itself isn't great. Instead of pointing out that
it's quite normal for a `nil` receiver not to define the `call` method,
it focuses on the missing method. Instead it would be more useful to
suggest to the user that `nil` should not be the receiver here and that
`@bar` was not assigned as expected.

Ruby developers of varying levels of experience can overlook a
NoMethodError because they don't notice `nil` as the receiver in the
exception message. Instead, they could erroneously try to investigate
their originally intended receiver.

## Unambiguous Feedback

Ruby's `ArgumentError` provides an ideal example of how feedback can be
improved for a very common error type. Take this simple method that
requires a single `code` argument:

```ruby
def explode(code)
  puts "#{code} Boom!"
end
```

When you call this method without passing the required argument, it
raises an exception and logically protests that you didn't provide the
correct number of arguments. One was expected, none were given.

```
> explode
ArgumentError: wrong number of arguments
 (given 0, expected 1)
  from (irb):1:in `explode'
  from (irb):4
  from /.../2.4.0/bin/irb:11:in `<main>'
```

Althought the original method signature could be included to save the
programmer a round trip to check the required arguments, this is a
pretty good error. Passing the required argument solves the problem:

```
> explode("abcd")
abcd Boom!
=> nil
```

But what if your team decides one day that explicit beats implicit and
replaces the `code` argument with a keyword argument:

```ruby
def explode(code:)
  puts "#{code} Boom!"
end
```

The different is hard to spot in the method signature because the only
difference is the colon (`:`) after `code`. Now calling `explode`
without any argument results in this:

```
> explode
ArgumentError: missing keyword: code
  from (irb):9:in `explode'
  from (irb):12
  from /.../2.4.0/bin/irb:11:in `<main>'
```

The argument error is now very different. Instead of focus on the number
of missing arguments, it simply states that there is a missing keyword
(argument) named `code`. Passing the explicit keyword argument resolves
this error:

```
> explode(code: "abcd")
abcd Boom!
=> nil
```

But what happens when old call sites for the `explode` method still
use the old argument?

```ruby
> explode("abcd")

???
```

Take a guess. I'll try not to spoil the answer for you with some blank
space.

<br>
<br>
<br>
<br>
<br>
<br>
<br>

Did you guess you would get a missing keyword argument error? Or perhaps
a weird "expected one argument, received one argument" error because
one *keyword* argument was expected but we provided one *regular*
argument?

Nope.

```
> explode("abcd")
ArgumentError: wrong number of arguments
(given 1, expected 0)
  from (irb):9:in `explode'
  from (irb):13
  from /.../2.4.0/bin/irb:11:in `<main>'
```

Did we provide the wrong number of arguments? Nope.
Did the method expect 0 arguments? Nope.
Did we give 1 argument? Actually, yes we did.

Is this error confusing as hell? Why yes, it is.

Keywords arguments were added to Ruby [in two stages][rubykw]. First
Ruby 2.0 introduced optional keyword arguments (`def explode(boom:
"abcd")`), then Ruby 2.1 layered in **required** keyword arguments (`def
explode(boom:)`). This is probably why this ArgumentError feedback is so
strange. The feature was added but the error handling logic in CRuby was
not updated to reflect the new behavior, which resulted in this odd
behavior.

Ten months ago I filed [a bug report][kwargs] to address this issue in
CRuby. Nobuyoshi "nobu" Nakada provided a fix which resulted in the
following improvement:

```
irb(main):005:0> explode("abcd")
ArgumentError: wrong number of arguments
(given 1, expected 0; required keyword: code)
  from (irb):1:in `explode'
  from (irb):5
  from /.../2.5.0-preview1/bin/irb:11:in `<main>'
```

Before you send me an email to say that the `given 1, expected 0` part
is still confusing, I know. That's a bit harder to fix and I hope we
can address it before Ruby 2.5 comes out on Christmas. Otherwise it will
sadly have to wait for a patch release later on.

Still! At least now if you have the courage or the attention span to
keep reading the error message til the end, you will see
`required keyword: code` which hopefully tips you off at the true cause
of the exception.

There is still a lot of work to be done to make the context and feedback
in Ruby errors more human-friendly. Look at CRuby's `error.c` to find
the [hierarchy of the built-in subclasses][errclasses] of Ruby's
`Exception` class. Many of those are in need of improvement, either with
better context or feedback.

If you know C or want to learn some C, the following are useful entry
points into CRuby's error handling internals:
- [argument_arity_error][argarity] defines `ArgumentError: wrong number of arguments` and its variants
- [rb_keyword_error_new][kwerror] defines `ArgumentError: missing keyword: code`
- [error.c][error.c]

If you're not familiar with all of Ruby's exceptions,
[Exceptional Creatures][ec] from Honeybadger is a lovely (and weird!) way to
discover more and learn about their specificities.

[1]: http://www.yukinishijima.net/2014/10/21/did-you-mean-experience-in-ruby.html
[2]: https://www.schneems.com/2014/12/27/going_the_distance.html
[poc]: https://bugs.ruby-lang.org/projects/ruby-trunk/activity?from=2015-04-18
[kwargs]: https://bugs.ruby-lang.org/issues/13196#change-65618
[rubykw]: https://chriszetter.com/blog/2012/11/02/keyword-arguments-in-ruby-2-dot-0/
[nilerr]: https://stackoverflow.com/search?q=undefined+method+for+nil%3ANilClass
[errclasses]: https://github.com/ruby/ruby/blob/d209b4c0a2df0e20c65791bfe4dbdaccb76744fc/error.c#L2139-L2174
[argarity]: https://github.com/ruby/ruby/blob/4b279cfdd2e3e4a05e852632f3305c893f6c46a4/vm_args.c#L715-L738
[error.c]: https://github.com/ruby/ruby/blob/d209b4c0a2df0e20c65791bfe4dbdaccb76744fc/error.c
[kwerror]: https://github.com/ruby/ruby/blob/4b279cfdd2e3e4a05e852632f3305c893f6c46a4/class.c#L1776-L1795
[ec]: https://www.exceptionalcreatures.com
