---
title: Concurrency in Ruby 3 with Guilds
layout: post
date: '2016-09-27 13:21:00'
update: 2020-11-19
location: Orlando, Florida
categories:
  - ruby
reviewers:
  - Aaron Patterson: http://tenderlove.com
editors:
  - Nate Berkopec: https://www.nateberkopec.com/
  - Chris Arcand: https://chrisarcand.com/
  - Elizabeth Mills: https://twitter.com/ArchaeoNemesis
---

**Note**: Since this post was written four years ago, Guilds were renamed
*Ractors* and were released as an experimental feature in Ruby 3.0. The feature
now includes great documentation and copious usage examples in the
[Ruby API documentation][ractor].

At [Ruby Kaigi][kaigi] 2016, [Koichi Sasada][koichi] — designer of the current
[Ruby virtual machine][yarv] and garbage collector — presented[^1] his
proposal for a new concurrency model in Ruby 3.

While Ruby has a thread system to allow for concurrency, [MRI][mri] doesn't
allow parallel execution of Ruby code. Koichi looked at the various challenges
of running Ruby in parallel including object mutation, race conditions, and
synchronization across Threads. The result was a [proposal][proposal] for a new
concurrent *and* parallel mechanism called Guilds.

## Concurrency Goals

If like me you're not a computer science graduate, or if concurrency just tends
to hurt your brain, you can read this clear explanation of the [differences
between concurrency and parallelism][paracurrent].

The stated goals for Guilds in Ruby 3 are to retain compatibility with Ruby 2,
allow for parallelism, reconsider global locks that prevent parallel execution,
try to allow fast object sharing, and provide special objects to share
mutable objects.

Concurrency in Ruby today is difficult because programmers have to manually
ensure that Threads don't create [race conditions][race-condition]. Common ways
around this issue involve introducing locks, like Ruby's
[`Thread::Mutex`][mutex], which somewhat defeat the initial purpose of
parallelism. Locks tend to slow down programs, and improperly placed locks can
even make concurrent programs run slower than synchronous equivalents.

## How Guilds Work

*Note: With Koichi's permission, I've reproduced some illustrations from his
[proposal][proposal] since they're helpful for understanding the concepts.*

Guilds are implemented in terms of the existing [`Thread`][thread] and
[`Fiber`][fiber] classes. While Threads allow for concurrent execution of code
scheduled by the operating system scheduler on your behalf, Fibers allow for
cooperative concurrency with execution scheduling that can be manually
controlled.

Guilds are composed of at least one Thread which in turn has at least one Fiber.
Threads from different Guilds can run in parallel while Threads in the same
Guild can't. Objects from one Guild cannot read or write to objects from another
Guild.

![Illustration of Guilds containing at least one Thread which contain at least
one Fiber][1]

Threads that belong to the same Guild can't execute in parallel since there's
a GGL (Giant Guild Lock) ensuring that each thread within a Guild executes one
after another. However, Threads from different Guilds can execute in parallel.

You can think of a Ruby 2.x program as having a single Guild.

<figure>
  <img src="{{ site.url }}/assets/ruby_3_guilds_concurrency.png" alt="Illustration of thread concurrency within Guilds and between Guilds">
  <figcaption>
    Threads T1 & T2 belong to Guild G1 and can't run in parallel, but T3 belongs
    to G2, and it can run while Threads from G1 are executing.
  </figcaption>
</figure>

## Communication Between Guilds

An object from one Guild will not be able to read or write to a mutable object
from a different Guild. Preventing mutation allows Guilds to operate concurrently
without running the risk of both accessing and modifying the same objects.

<figure>
  <img src="{{ site.url }}/assets/ruby_3_guilds_object_access_restrictions.png" alt="Illustration of Guilds being unable to read or write each other's objects">
  <figcaption>
    Objects from one Guild can't access objects from a different Guild.
  </figcaption>
</figure>

However, Guilds can communicate with each other using the `Guild::Channel`
interface which allows for the copying or moving of objects across the channel
to another Guild.

The `Guild::Channel`'s `transfer(object)` method sends a deep copy of the `object` to
a destination Guild.

![Illustration of Guild Channels copying objects from one channel to another][2]

It's also possible to completely move an object from one Guild to another using
`Guild::Channel`'s `transfer_membership(object)`.

![Illustration of Guild Channels moving objects from one channel to another][3]

Once an object's membership has been transferred to a new Guild, it is no longer
accessible from its original Guild, and any attempt to access the object will
raise an error.

While Guilds can't share mutable objects without previously copying or
transferring to one another, it's important to note that **immutable objects can
be shared (read) across Guilds** as long as they're "deeply frozen", meaning
every object they reference is also immutable.

Here's an example to distinguish mutable from immutable objects:

```ruby
# While Numeric types like Integers are immutable by
# default, Hash instances aren't.
mutable = [1, { "key" => "value" }, 3].freeze
```

```ruby
# But if you freeze String or Hash instances and the
# Array instances that reference them, then you have
# a "deeply frozen" immutable object.
immutable = [
  "bar".freeze,
  { "key" => "value".freeze }.freeze
].freeze
```

## Usage Example

During his talk, Koichi Sasada gave a few succinct examples of how Guilds could
work. I'd like to reproduce the simplest one that applies Guilds to computing
Fibonacci in parallel. The example below has been modified slightly for clarity.

```ruby
def fibonacci(n)
  return n if n <= 1
  fibonacci( n - 1 ) + fibonacci( n - 2 )
end

guild_fibonacci = Guild.new(script: %q{
  channel = Guild.default_channel

  while(n, return_channel = channel.receive)
    return_channel.transfer( fibonacci(n) )
  end
})

channel = Guild::Channel.new \
  guild_fibonacci.transfer([3, channel])

puts channel.receive
```

## Advantages of Guilds over Threads

With Threads, it's difficult to figure out which objects are shared mutable
objects. Guilds prevent their use altogether and instead makes sharing
*immutable* objects much easier. Koichi has planned for "special data
structures" to share mutable objects with Guilds. These structures would
automatically isolate risky mutable code.

There is, however, a trade-off, since communication between Guilds is much more
tedious than between Threads.

## Performance

It's my understanding that the current C implementation of Guilds is roughly 400
lines of code. While the source isn't yet available, Koichi hinted at the
performance benefits of Guilds by comparing a single-guild execution of the
fibonacci example with a multi-guild one.

On a **dual core** Linux virtual machine running within Windows 7, Koichi
observed the following results:

![Illustration of single vs. multi-guild performance at fibonacci function solving][4]

It may not be representative of real-world improvement in most Ruby
applications, but I can't wait to see the impact of Guilds on
[RubyBench][rubybench].

## Conclusions

The Guild concept is an exciting way to introduce easier mutation-safe
concurrency workflows to Ruby. I can't wait for Koichi Sasada and the Ruby core
team to share more about this proposal in the future.

I do have minor concerns about the naming of the object copy and move methods
for `Guild::Channel`. `transfer(object)` seems to imply an exchange, but it
merely results in a deep copy of the object. I believe `transfer_copy(object)`
or simply `copy(object)` would be less confusing. And
`transfer_membership(object)`, the move/transfer method, could simply be named
`channel.transfer(object)`. Thankfully, it seems that the method names
aren't set in stone.

I'd encourage the Ruby core team to release this new feature under an opt-in
experimental flag so that the Ruby community can participate in testing.
Hopefully, this would allow us to have this feature available before 2020 — the
expected release date of Ruby 3.0. Guilds will have a positive impact on Ruby's
reputation as a concurrent-friendly language. It would be welcome soon, warts
and all.

---

[^1]: A video of the talk is [already available][talk].

[kaigi]: http://rubykaigi.org/2016
[koichi]: http://www.atdot.net/~ko1/
[talk]: https://www.youtube.com/watch?v=WIrYh14H9kA&feature=youtu.be
[proposal]: http://www.atdot.net/~ko1/activities/2016_rubykaigi.pdf
[yarv]: https://en.wikipedia.org/wiki/YARV
[mri]: https://en.wikipedia.org/wiki/Ruby_MRI
[thread]: https://ruby-doc.org/core-2.3.1/Thread.html
[fiber]: https://ruby-doc.org/core-2.3.1/Fiber.html
[race-condition]: https://en.wikipedia.org/wiki/Race_condition
[mutex]: https://ruby-doc.org/core-2.3.1/Thread/Mutex.html
[rubybench]: https://rubybench.org/
[paracurrent]: http://bytearcher.com/articles/parallel-vs-concurrent/
[1]: {{ site.url }}/assets/ruby_3_guilds_threads_and_fibers.png
[2]: {{ site.url }}/assets/ruby_3_guilds_channels_object_copy.png
[3]: {{ site.url }}/assets/ruby_3_guilds_channels_object_move.png
[4]: {{ site.url }}/assets/ruby_3_guilds_fibonacci_performance.png
[rf]: http://rubyfacets.com
[rfpost]: http://olivierlacan.com/posts/ruby-facets/
[ractor]: https://docs.ruby-lang.org/en/master/doc/ractor_md.html
