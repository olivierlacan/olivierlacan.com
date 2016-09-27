---
title: Concurrency in Ruby 3 with Guilds
layout: post
date: '2016-09-27 13:21:00'
location: Orlando, Florida
categories: development
draft: true
reviewers:
  - Aaron Patterson: http://tenderlove.com
editors:
  - Nate Berkopec: https://www.nateberkopec.com/
---

At Ruby Kaigi on September 8th, 2016, [Koichi Sasada][koichi] — who designed
[YARV][yarv], the current Ruby virtual machine, and the latest iterations of the
Ruby garbage collector — [presented][talk] [his proposal][proposal] for a new
concurrency model in Ruby 3. With Koichi's permission, I used the illustrations
from his talk since they're quite helpful in understanding the concepts.

While Ruby has a thread system to allow for concurrency, [MRI][mri] doesn't
allow parallel execution of Ruby code. Koichi proposed a new concurrent AND
parallel mechanism called Guilds. He looked at the problem of object mutation,
race conditions, and synchronization across threads and tried to come up with a
new concept to solve these issues.

## Concurrency Goals

The stated goals for Guilds in Ruby 3 are to retain compatibility with Ruby 2,
allow for parallelism, reconsider global locks that prevent parallel execution,
allow objects to be shared in a fast way if possible, and otherwise to provide
special objects in order to share mutable objects if necessary.

Concurrency in Ruby today is difficult because programmers have to manually
ensure that threads don't create [race conditions][race-condition]. Common ways
around this issue involve introducing locks, like Ruby's [`Thread::Mutex`][mutex]
which somewhat defeat the initial purpose of parallelism. Locks tend to slow
down programs and improperly placed locks can even make concurrent programs run
slower than synchronous equivalents.

## How Guilds Work

Guilds are implemented in terms of the existing [`Thread`][thread] and
[`Fiber`][fiber] classes. While threads allow for concurrent execution of code
scheduled by the operating system scheduler on your behalf, fibers allow for
cooperative concurrency with execution scheduling that can be manually
controlled.

Guilds are composed of at least one Thread which in turn has at least one Fiber.
Threads from different Guilds can run in parallel while threads in the same
guild can't. Objects from one guild cannot read or write to objects from another
guild.

![Illustration of Guilds containing at least one Thread which contain at least
one Fiber][1]

Threads that belong to the same guild can't execute concurrently since there's
a GGL (Giant Guild Lock) ensuring that each thread within a guild execute one
after another. However, threads from different guilds can execute concurrently.

You can think of a Ruby 2.x program as having a single Guild.

<figure>
  <img src="{{ site.url }}/assets/ruby_3_guilds_concurrency.png" alt="Illustration of thread concurrency within guilds and between guilds">
  <figcaption>
    Threads T1 & T2 belong to guild G1 and can't run concurrently but thread
    T3 belongs to guild G2 and it can run while threads from guild G1 are
    executing. — Illustration: [Koichi Sasada][koichi], [A proposal of new concurrency model for Ruby 3][proposal].
  </figcaption>
</figure>

## Communication Between Guilds

An object from one guild will not be able to read or write to a mutable object
from a different guild. Preventing mutation allows Guilds to operate concurrently
without running the risk of both accessing a modifying the same objects.

<figure>
  <img src="{{ site.url }}/assets/ruby_3_guilds_object_access_restrictions.png" alt="Illustration of Guilds being unable to read or write each other's objects">
  <figcaption>
    Objects from one guild can't access objects from a different guild. — Illustration: [Koichi Sasada][koichi], [A proposal of new concurrency model for Ruby 3][proposal]
  </figcaption>
</figure>

However, guilds can communicate between each other using the `Guild::Channel`
interface which allows for the copying or moving of objects across the channel
to another guild.

The `Guild::Channel#transfer(object)` method sends a deep copy of the `object` to
a destination guild.

![Illustration of Guild Channels copying objects from one channel to another][2]

It's also possible to completely move an object from one guild to another using
`Guild::Channel#transfer_membership(object)`.

![Illustration of Guild Channels moving objects from one channel to another][3]

Once an object's membership has been transferred to a new guild, it is no longer
accessible from its original guild and attempts to access the object will raise
errors.

While guilds can't share mutable objects without previously copying or
transfering to one another, it's important to note that **immutable objects can be shared (i.e. read)
across guilds**, as long as they're "deeply frozen" — meaning every object they
reference is also immutable. Here's a clear example Koichi gave:

```ruby
# While Numeric types like Integers are immutable by default, Hash instances aren't.
mutable = [1, { "key" => "value" }, 3].freeze

# But if you freeze String or Hash instances and the Array instances that references
# them, then you have a "deeply frozen" immutable object.
immutable = [
  "bar".freeze,
  { "key" => "value".freeze }.freeze
].freeze
```

## Example

Koichi Sasada gave a few succinct examples during his talk of how guilds could
work. I'd like to reproduce the simplest one that applies Guilds to computing
Fibonacci in parallel. The example below is slightly modified in order to be
more clear.

```ruby
def fibonacci(n)
  return n if n <= 1

  ( fibonacci( n - 1 ) + fibonacci( n - 2 ) )
end

guild_fibonacci = Guild.new(script: %q{
  channel = Guild.default_channel

  while(n, return_channel = channel.receive)
    return_channel.transfer( fibonacci(n) )
  end
})

channel = Guild::Channel.new( guild_fibonacci.transfer([3, channel]) )

puts channel.receive
```

## Advantages of Guilds over Threads

While it's difficult to figure out which objects are shared mutable objects
when using threads, Guilds prevents the use of them altogether. Koichi seems
to have planned for what he describes as "special data structures" who would
solely have the privilege to share mutable objects with guilds. But since this
would be the only source of shared mutable objects across guilds, it would be
easier to isolate the risky code.

There is however a trade-off, since communication between guilds is much more
tedious than between threads.

## Performance

It's my understanding that the current C implementation of Guilds is about 400
lines of code. The source isn't available to peruse yet but Koichi gave an idea
of what to expect with regard to performance in his talk by comparing a
single-guild execution of the fibonacci example with a multi-guild one.

On a dual core Linux virtual machine runnin within Windows 7 he had the following
results:

![Illustration of single vs. multi-guild performance at fibonacci function solving][4]

## Conclusions

I find Guilds an exciting idea to introduce much easier mutation-safe
concurrency workflow for Ruby. I can't wait for Koichi Sasada and the Ruby core
team to share more about this proposal.

I do have concerns about the naming of the object copy and move methods for
`Guild::Channel`. `channel.transfer(object)` seems to imply an exchange while it
in fact only results in a deep copy of the object. I believe
`channel.transfer_copy(object)` or simply `channel.copy(object)` would be far
less confusing. Especially when compared with
`channel.transfer_membership(object)`, the actual move/transfer method, which
could then simply be named `channel.transfer(object)` without pushing the guild
abstraction of object membership to guilds a little too far.

Aside from these concerns I would encourage the Ruby core team to experiment
with this new concept under some sort of opt-in experimental flag so that we
can potentially accelerate testing and hopefully see this feature available
before 2020 — the expected release date of Ruby 3.0.

---
**Didn't hate the way I explained all this stuff? You might enjoy
[Ruby Facets][rf], a short &amp; sweet Ruby news podcast I host every week.**

[koichi]: http://www.atdot.net/~ko1/
[talk]: https://www.youtube.com/watch?v=WIrYh14H9kA&feature=youtu.be
[proposal]: http://www.atdot.net/~ko1/activities/2016_rubykaigi.pdf
[yarv]: https://en.wikipedia.org/wiki/YARV
[mri]: https://en.wikipedia.org/wiki/Ruby_MRI
[thread]: https://ruby-doc.org/core-2.3.1/Thread.html
[fiber]: https://ruby-doc.org/core-2.3.1/Fiber.html
[race-condition]: https://en.wikipedia.org/wiki/Race_condition
[mutex]: https://ruby-doc.org/core-2.3.1/Thread/Mutex.html
[1]: {{ site.url }}/assets/ruby_3_guilds_threads_and_fibers.png
[2]: {{ site.url }}/assets/ruby_3_guilds_channels_object_copy.png
[3]: {{ site.url }}/assets/ruby_3_guilds_channels_object_move.png
[4]: {{ site.url }}/assets/ruby_3_guilds_fibonacci_performance.png
[rf]: http://rubyfacets.com
[rfpost]: http://olivierlacan.com/posts/ruby-facets/
