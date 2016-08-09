---
layout: post
title: "Jumping between words in the console"
date: 2014-08-20 00:33
location: "Paris, France"
categories: development
---

There are many obvious ways to waste one's time, and there are the less
obvious ones. Let's talk about the latter.

One of the first thing I notice when pairing with co-workers and friends
is whether or not they have what is often described as "option as meta
key" enabled in their Shell app.

Even in a basic text editor like OS X's TextEdit, whenver you type words
separated by spaces, you can easily jump to the beginning of each word by
using the `Option` key alongside with either the `Left` or `Right` arrow
keys. Nothing amazing, maybe you think this is neat.

![Flying between words in TextEdit]({{ site.url }}/assets/flying-between-words.gif)

Well, inside of a Shell, you often can't use your mouse to place your
cursor wherever you wish. This seems backwards (because it is) but it's
a remnant of a world where the mouse didn't exist. Regardless, many
developers eschew the mouse altogether for the sake of keyboard
efficiency. Yet it seems like few developers realize that this fast
jumping between words is also possible in their Shell.

## Terminal

On OS X, in the default Terminal app, when you open Preferences (please
use `Command` + `,` to do that in any OS X app worth its salt) and go to
the `Settings` tab, under `Keyboard` you will find a checkbox named
`Use option as meta key`.

![Terminal Option as meta key setting]({{ site.url }}/assets/terminal-option.png)

Enabling this option will let you fly between
words with your arrow keys when holding `Option`.

You're welcome.

![Flying between words in Terminal]({{ site.url }}/assets/still-flying-between-words.gif)

## iTerm

And if you're one of those fancy cats using iTerm, the process is a bit
more involved. Go to `Preferences` (you better be using `Command` + `,`
this time), under the `Keys` tab. In there you'll see a list of
`Global Shortcut Keys`. You'll need to add the following two global
shortcuts.

### Jumping Left

![iTerm Setting to Jump Left]({{ site.url }}/assets/iterm-option-left.png)

Hold the `Option` and `Left Arrow` keys in the `Keyboard Shortcut`
input field, then select the `Send Escape Sequence` Action, and finally
set the `Esc+` field to `B` (for back).

### Jumping Right

![iTerm Setting to Jump Right]({{ site.url }}/assets/iterm-option-right.png)

Hold the `Option` and `Right Arrow` keys in the `Keyboard Shortcut`
input field, then select the `Send Escape Sequence` Action, and finally
set the `Esc+` field to `F` (for forward).

You'll see a warning whenever you save those shortcuts. I believe it's
okay to ignore these unless you already use a keyboard shortcut profile
that has the same combinations of keys. In this situation you will have
to delete your Profile-specific shortcuts otherwise they will override
the global ones presented below, otherwise this won't work as expected.

![iTerm Global Shortcut Warning Prompt]({{ site.url }}/assets/iterm-shortcut-warning.png)

This optimization is an example of something you can apply to your life
every single day. What task or step of a task are you repeating over and
over again. Have you tried to find a better, faster way to do it?

It it seems too difficult? What about working with someone by your side
(pairing) and asking them if they have a solution, perhaps? Every single
time I pair with someone on our team at [Code School](http://codeschool.com)
I learn something new like this.

What I like even more is that these tricks don't always correlate with
experience. Many people with experience settle for inefficient workflows
because they've become comfortable with them. Sometimes, that's fine.
Changing a workflow that works can be a distraction. More often though,
you can chip away at the little frustrations of your day and hone your
tools little by little, until you master them.

PS: If this topic interests you I highly recommend listening the
[Sharpening Tools episode of the Ruby Rogues podcast](http://rubyrogues.com/129-rr-sharpening-tools-with-ben-orenstein/)
with [Ben Orenstein](https://twitter.com/r00k). His daily ritual to find
something inefficient from the days or weeks before and search for a way
to optimize it is an excellent idea.
