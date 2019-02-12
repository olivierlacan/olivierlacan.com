---
layout: post
title: "The Art and Science of Debugging"
date: 2014-10-25 23:45
location: "Paris, France"
categories: development
draft: true
---
I've considered myself a programmer for about four years now.

At the very beginning of that journey, I vividly remember watching — my
mouth slightly agape — as my college roommate opened up a Ruby library
that was misbehaving in a text editor instead of a browser pointed to
stackoverflow.com.

I don't mean to suggest that looking things up on the web isn't "true
debugging". That's ridiculous. I don't think there's such a thing as
scientific method of debugging. It seems like everybody goes about it
their own way.

When faced with an error message, Google seems like the obvious first
step. But why?

> Because if it's happening to me, it must have happened to somebody
> else?

But what if you're [the first one](http://xkcd.com/979/) it's happening to?

> Well... fuck.

Yeah! It's great to able to rely on the kindness and shared misery of
others but it's hardly a reliable methodology. At some point, you'll run
out of answers catering to your particular problem.

Whenever comes a day when no promising result when I paste an error
message and use Google's Search Tools to switch from "All Results" to
"Verbatim"; a day when I don't have an error message and all the strings
of keywords describing my situation I can arrange don't invoke a
miraculously fitting GitHub issue as a chorus of angels erupts in the
background; whenever those shitty days happen I'm thrown back into that
chair when Andrew dove right into the guts of
[Cramp](https://github.com/lifo/cramp).

And then instead of the error message, my eyes slowly descend upon the
terrifying depths of the stacktrace. In a feat of courage or insanity, I
go beyond the first few lines of the application trace and dare to gaze
upon the framework trace. Yes, this is Rails, but this experience can be
found elsewhere too.

After giving my eyes a few seconds to adjust to the atrocious
information architecture sadly commonplace on the command line, I stop.

I *know* this library name. And *this* one. And *that* one.

Through years of familiarity with Rails I've developed a feel for the
neighborhood. No I've never looked at the source code for Rack. I
haven't needed to. Neither have I ever really tried to understand every
single step a browser request goes through in order to be satisfied by
Rails.

Bolstered by the companionship of my fellow explorer Joel, I decide to
strap on my boots and debug the shit out of this goddamn request.

The scene is a freshly upgraded Rails 4.0.9 application but it's old.
The first incarnation of the app was built with Rails 3.0 back in 2010.
It was updated to Rails 3.2 just a few months ago, by me. Yes, it's Code
School. I know we should have been on Rails 4 already. You don't see me
making fun of GitHub for staying on Rails 2.x for years anymore, so
shush.

The application boots properly. Yet when loading `http://codeschool.dev`
(with Pow) or `http://localhost:3000` (with `rails server` and thin)
only a blank page appears. Insinctively I go first to the development
logs, thinking there must be an issue with the server: the app is
running and no request was logged.

![Come again for big fudge?!](https://ethereal365.files.wordpress.com/2014/04/tumblr_m1tm7onswt1r9udrko1_500.gif)

I hit `Shift` + `Command` + `R` to make sure the browser cache is
ignored for a new request to the root of the application. Still nothing.
I want to see this damn request Chrome is sending so I open the
developer tools with `Option` + `Command` + `C`, go to the `Network`
tab. `Disable Cache` is checked and I will find out later that `Shift` +
`Command` + `R` in Chrome does not in fact ignore the cache when
reloading the page (as Safari and Firefox do) but that the only way to
disable the browser cache completely is to open the devtools and have
this option checked. Way to be different for no sensible reason, Google.

Here I'd like to make a quick aside about rabbit holes. Finding out
information about how browsers *actually* behave is never ever ever
going to be a waste of your time as a developer. It's not a waste of
your client's time if you're a consultant and it's not a waste of your
boss/customer's time if your work on your own product. That's because
expanding your knowledge of your craft makes you and your software
better. The best place to learn this stuff isn't in a book, at a
conference or from a friend on the bus; it's here while you're doing
shit because you're in the context and you're applying it. Immediately
applying newfound knowledge is one of the best way to ensure that
knowledge is retained over time. You're a knowledge worker, it's your
**job** to learn stuff and be paid for it.

Knowledge break over. Back on task. Despite the cache busting: no dice.
I'm still not seeing Rails receive my request for the root of the app.
Now that's when things get interesting. I decide to add `/courses` to
the URL. That's a valid route but since I'm not getting the homepage, I
don't expect it to work.

Of course, it works.

The request is logged properly in `logs/development.log` and everything.
I click on an actual link to the homepage from that courses page: blank
page again.

That's when the anger takes over from the bewilderment. Why is this
happening to me? All I want is to ship Rails 4 so our team can work a
bit faster, so I can updated a few scary dependencies (or remove them),
so our site loads a bit faster for our customers, so I worry less about
a stray security bullet. But nope, this has to happen to me, now.

Remember that thing I said earlier about stacktraces, and how I
discovered they don't scare me anymore? WELL THAT'S GREAT WHEN YOU DON'T
EVEN HAVE A STACKTRACE. I never thought I would miss those things, but I
do. After a few vain attempts to find people with similar symptions on
GitHub, StackOverflow, and the deep end of Google, desperation pushes me
to tweet in the hopes that someone who follows me encountered something
like this in the past but stayed mum for fear of being thought insane by
the rest of us.

This — Twitter I mean — by the way is an amazing debugging tool. I'm
aware it's a privilege I have. I'm verbose, loud, and I'm neither a
woman nor a person of color so statistically my chances of amassing
followers who don't threaten to rape or murder me is pretty high.
Clearly, not everyone can use Twitter as a debugging tool so here's an
idea: if you ever encounter something truly befuddling that you can't
solve after hours upon hours, shoot me a tweet and I'll help retweet
your cry for help. I'm sure others with some visibility would be willing
to do that too.

Back to the Phantom Stacktrace I see myself faced with two options:
1. try to guess what gem (Ruby library) could be causing this issue and
   disable pretty much anything that could remotely impact just this one
   page
2. try to find a way to piggy back on the request so I can understand
   why it goes to nowhere

Despite the wonderful learning opportunity afforded to me by option 2,
you can bet your ass I tried to go the easy option 1 route first:
couldn't make a dent. So there I was, thinking: "Well shit, I don't even
know where Rails (or Thin) receives a request!"

If you mumbled "Duh, the routes!" to yourself. It's not that easy.

## Down the Rabbit Hole
I want to see a stacktrace. I need to see a stacktrace. I can't make any
assumptions. So I'm going to follow a request the whole way through.

I open my my browser to a non-existent URL I know will trigger a 404:
`/blablabla`.

I then open the `Full Trace` view from the Rails Routing Error page.

![The Rails 4 Routing Error page on a 404]({{ site.url }}/assets/rails_4_routing_error.png)

This obviously tells me nothing, but the `Full Trace` is bound to yield
more information about what part of Rails first receives the request.

![The Rails 4 Routing Error Full Trace page on a 404]({{ site.url }}/assets/rails_4_routing_error_full_trace.png)

Alright, so `railties (4.0.9) lib/rails/application.rb:97:in 'call'` it
is. Time to open up that gem (railties) and drop a `binding.pry` in
there so Pry can help me follow the call through the stack.

```bash
bundle open railties
```

Since I've configured my `$EDITOR` shell environment variable with the
following in my `.bash_profile`:

```bash
export EDITOR="sublime -n -w"
# the -n flag opens a new window
# the -w waits for the files to be closed before returning
# this is useful for git commit messages
```

Now I'm inside this `lib/rails/application.rb` class inside of railties,
at line 95 I add a `binding.pry`. This works for me because I have `pry`
in the Gemfile of the Rails application that also requires this
`railties` gem. It wouldn't otherwise.

No need to restart your Rails server to have the `binding.pry` do its
trick. Instead of going to `/blablabla` this time, we'll go to the root
of the application at `localhost:3000/` instead. Where the output from
the Rails logs used to be in my shell, there should be a `Pry` prompt
showing me the context where the breakpoint stopped the execution. Now
starts the exploration.

I can see there's an `env` parameter being passed to this `call` method
so I'm curious what it is. Typing the name of any object reference in
Pry will pretty print its return value which helps inspecting things.

There's not much to learn from this output. I can see that
`env["REQUEST_URI"]` and `env["PATH_INFO"]`point to `"/"`, which makes
sense. What I'm more curious about is what Rails sends back during this
request/response cycle. Or rather, what it doesn't send back. Within
`Pry`, calling `step` will step the execution forward line by line. That
means you'll have to follow along the execution of any nested method
call. This might take a while, so there's another method called `next`
which steps over the following line, allowing execution to proceed but
within following it down nested method calls. This will allow us to
follow the execution at a high level, from where we are, without going
to deep inside probably irrelevant method calls.

The `whereami` command is useful to get your bearings. It will display
the source code context of the current execution frame and show which
line is currently about to be executed.

At the end of this `call` method inside `lib/rails/application.rb`,
there is a call to `super(env)` — passing the environment to some
inherited implementation of the `call` method. The `call` method is
familiar because it's the crux of the implementation of the `rack`
library. Rails, like many Ruby web frameworks is "rack-compliant"
because it follows the request/response flow established by `Rack`.

As soon as we send the `next` command on the line containing
`super(env)`, we found ourselves catapulted inside of the `rack` gem.
Precisely inside `lib/rack/content_length.rb` at line 15, in Rack's own
`call` method. All that a Rack-compliant Ruby application has to do is
to return an array inside of `call`. The array should contain these
three ordered items: status code, headers, response body.

I'm very interested in what is causing Rails & Rack to send back an
empty body. I check the `env` once again by curiosity. That's where I
notice something strange: `env["REQUEST_URI"]` still points to `"/"` but
`env["PATH_INFO"]` now points to `"%2Findex.html"`. Why is Rack thinking
there's an `index.html` file at the root?

This is the part of the story where you were ahead of me the whole time.
Yes, I was convinced I had checked all the obvious things. But of course
that wasn't true. I didn't check to see if there was a file at
`public/index.html`. There was one. It was empty. I have no idea it was
there. We obviously didn't use this file under Rails 3.x since we had a
`root to: "home#show"` declaration and a cached `show` action to display
our home page. But somehow, this file lingered there ignored by Rails
3.x and it is no longer ignored by Rails 4.x. I suspect that is because
the `index.html` default file has been eliminated in favor of a default
controller action when no root route is defined.

I still haven't figured out exactly where Rails and Rack decide that a
static file in `public/` takes precedence over a `root` declaration in
`routes.rb`, but if you have, let me know. This will help me get some
closure with this whole adventure.

PS: Of course right in the middle of writing this ridiculously verbose
piece I was made aware of this talk by the Blithe Rocher. You should
probably listen to her first.
