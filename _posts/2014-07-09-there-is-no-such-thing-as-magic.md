---
layout: post
title: "There is no such thing as magic."
date: 2014-07-09 14:51
location: "Orlando, Florida"
categories: development
---

> “So this is, like, if I took a spaceship to Titan — the moon of
> Jupiter — and I saw Taco Bell there, I’d be like: ‘No.’”.

This comes from a conversation I had while pairing the other day. Let me
bring in some context. I had showed Morgan — the newest member of our
Internal Code School team — how awesome Bash autocompletions are inside
a shell session, especially when dealing with unfamiliar file names.

For example you want to `cd` into a folder called `banana`, all you have
to do is type `cd bana` then hit the `Tab` key and tadaaa it suddenly
morphs into `cd banana/` before your very eyes.

Morgan and I had to debug a spec in which we put a `binding.pry` call
from the excellent [Pry gem](http://pryrepl.org/) in order to stop
execution and fumble around to figure out why a specific test was
behaving oddly. We had defined a `user` variable and I asked morgan to
call a method on that `ActiveRecord` instance this variable was pointing
too. As she started to type out the full method name I think I sneakily
hit her Tab key with the swiftness of a famished Fox.

To my surprise, Morgan wasn't happy about this at all. Her response was:

> "No."

She didn't say that because this little trick wasn't cool. She didn't
say it because it wasn't useful. She didn't say it because it's kind of
a dick move to take over your pair's keyboard — it is — while pairing.
She said "No." because she didn't understand how the Pry session could
possibly allow her to do this: use autocompletion on a Ruby object's
methods.

After laughing (a lot) she used the sentence I started this post with to
help me understand how she felt. Aside from being hilarious, it was a
very good example. Magic (in the context of programming) isn't cool,
it's simply useful — sometimes. What's really cool, and I bet Morgan
would agree with me, is how what appears to be magic actually works.
Because there is no such thing as magic.

Do you think I took the time to explain to Morgan how this awesome
method autocompletion trick works? Nope. Why? Well, I had no idea how it
worked.

Now, thanks in part to a great blog post by Ross Kaff — [Ruby, You
Autocomplete Me](http://rosskaff.com/blog/2014/02/ruby,-you-autocomplete-me.html) — I do understand how it works. So I thought I'd
share it with you too.

Guess what?
It's definitely not magic. Ross' post didn't fully satisfy my
curiosity so I ended up looking at the `IRB::InputCompletor` [source
code in
Ruby](https://github.com/ruby/ruby/blob/trunk/lib/irb/completion.rb) and
it was illuminating.

This is one of the few times in my life when — despite being a Ruby
programmer — I have looked at the actual Ruby source
code to understand how something works. Every time I discover coding
conventions I'm either not familiar with or didn't expect to find there.

What's amusing when you start [unweaving the magic rainbow]
(http://en.wikipedia.org/wiki/Unweaving_the_Rainbow) is that you
discover how simple things actually are.

`IRB::Completion` uses a gigantic `case` statement against the inputed
text on which completion is attempted. So if you run `pry`[^3] and type:

```ruby
"Howdy".rev
```

And hit the `Tab` key, it will complete to `"Howdy".reverse`. Why?

1. the input before you hit the `Tab` key starts with a double quote
   which means `IRB::Completion`'s [first `when` statement](https://github.com/ruby/ruby/blob/trunk/lib/irb/completion.rb#L44) catches it.
2. the [`receiver`](https://github.com/ruby/ruby/blob/trunk/lib/irb/completion.rb#L46) (first match returned by [the regular expression](https://github.com/ruby/ruby/blob/trunk/lib/irb/completion.rb#L44)) is
   saved to a variable using the `$1` global variable[^1].
3. the third match from the regular expression (the second one being the
   `.` separating the receiver from method (or method call) is saved to
   the [`message`](https://github.com/ruby/ruby/blob/trunk/lib/irb/completion.rb#L47) variable.
4. Using one of my favorite bit of Ruby introspection, all the possible
   instance methods available[^2] to the String class are collected (an
   alias of the `Enumerable#map` method) into a `candidates` array.
5. The [`select_message`](https://github.com/ruby/ruby/blob/trunk/lib/irb/completion.rb#L216-L226) class method is called with the
   `receiver`, `message`, and `candidates` in order to determine what
   methods should be suggested for completion.

That's it. All the possible candidate methods will now be displayed in
the console as completion suggestions when you hit the `Tab` key twice.
If there is only one match, hitting the `Tab` key once will complete the
method name using that match.

```ruby
"Howdy".reverse
```

![Tadaaa!]({{ site.url }}/images/tadaaa.gif)

Having people with different skill levels and backgrounds on our team
has been a perfect opportunity for me to rediscover the things that I
take for granted. When you're new it's often difficult (but not
impossible) to understand how some of the things you use work. There are
many tools I grown comfortable using and yet I don't fully understand
how they work. As I hope I've demonstrated, it doesn't take very long to
understand how the tricks are done.

[^1]: You can see all global variables by running `puts global_variables` or [read some more Ruby source code documentation](https://github.com/ruby/ruby/blob/trunk/lib/English.rb#L147-L153) to understand all that the global variables can do.
[^2]: Including instance methods from any ancestor class to String (i.e. classes String inherits from and which you can inspect by calling `String.class.ancestors`)
[^3]: If you really don't want to use Pry you can turn on IRB completion by either calling `require 'irb/completion'` or [adding a few settings to an `~/.irbrc` file](http://stackoverflow.com/a/1382216/385622).
