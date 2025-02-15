---
layout: post
title: "The $PATH to Enlightenment"
original: 2014-04-17 13:23
date: 2020-01-01 13:23
date: 2025-02-15 01:28
categories: development
draft: true
---

*Chers francophones, l'aimable Pierre Choffé a 
[traduit cet article en français sur son blog La Cascade][cascade].*

[cascade]: https://la-cascade.io/articles/le-path-vers-la-lumiere

Contributing to open source software always involves a bit of tedious
setup. While it often distracts from the end goal (solving problems), the setup
process is often an opportunity to discover how comfortable people are
with one of the main tools of their trade: the command line.

It's possible to work on the web without dealing with the command line.
It's also possible to build a house without using power tools.

I know the command line is inherently spooky to many people. It's the
embodiment of arcane technology wielded by "hackers" and "computer
wizards". Except it's not. It's a set of ridiculously simple tools
created by Bell (now AT&T) employees to accomplish mostly simple tasks
in the 1970s. It's just as much of a "space age" technology as your
micro-wave oven.

Thankfully, through a few concepts and metaphors, we can shine a light
on the darkest corners of this command line.

One of the most important of these concepts is the `$PATH`.

Several front-end frameworks, CSS preprocessors,
JavaScript libraries, and a flurry of other web development tools rely
on either Ruby or Node.js being installed on your machine. [Bower](http://bower.io/)
is one such tool.

Invariably, these issues will lead you to the $PATH because it will need
to be aware of all the tools you install for your development
environment in order to function properly.

Taking a step back to understand how the $PATH works is indeed a step
backwards, but the more you use command line tools, the greater the
chances the $PATH will cause you to lose a lot more time, or even throw
heavy things at your computer screen.

## A humble little variable

`$PATH` as denoted by the dollar sign prefix and the shouty uppercase is
a Unix environment variable. What is stored inside of this variable (a
basic programming structure) is a colon-delimited list of directory
paths. Something like:

```
/root/directory/binary:/root/other_directory/other_binary
```

Now, if you're curious what other kinds of environment variables exist
on your system, you can type in the `env` command in your own command
line prompt [Note: does this work on Windows too?], hit `Enter` and you
will see a list of all the environment variables that currently exist.

Since `$PATH` is a variable, it can be modified as you wish, on the fly.
For instance by running this in your shell:

```bash
$ export PATH=banana
```

What does this do? Well, try to run the export command above in a new
window inside of your Terminal or whichever shell app (Terminal on OS X)
you use.

Now type any basic Unix command like `ls`. You'll see `-bash: ls:
command not found`.

This sabotage was useful because now we know that without the content
inside our `$PATH`, shit just goes bananas — if you pardon my lovely
circular pun.

But why? Because as many load paths do (including in programming
languages and frameworks like Rails), this one determines what can be
executed in your shell.

Oh, by the way, just quit your shell application and restart it all your
commands will be back.

## A tale of so many binaries

In Unix, executable programs are called binaries. It's a crappy name
because it's based on the format of the executable program, not its
function. When you write a Unix program, you have to compile it before
it can be executed. This compiling process creates the 'binary`. A file
that instead of using plain text uses some binary format to make
instructions easier to process for a computer.

Unix comes with multiple directories to store binaries. You can see
which are the default directory used to load binaries in the
`/etc/paths` file.

```bash
# the cat command can print the content of a file
$ cat /etc/paths

/usr/bin
/bin
/usr/sbin
/sbin
/usr/local/bin
```

The file contains one directory per line. The paths are listed in a
meaningful order. When a binary is found in one path, it is loaded. If a
binary with the same name is found in another path, it is ignored. Paths
listed earlier take precedence over paths listed later.

This is why it's common to run into problems when trying to install a
binary for something that already exists on your system. In the case of
OS X, git is good example.

If I `cd` into `/usr/bin` and run `ls` (list directory contents) I get
over 1000 results. If I run `ls | grep git` I'm able to filter the
results of the ls command that match the pattern "git".

```bash
$ ls | grep git
git
git-cvsserver
git-receive-pack
git-shell
git-upload-archive
git-upload-pack
```

Sure enough, there was a binary for it inside. On a clean OS X install
you will see `/usr/bin/git` returned when you run `which git`:

```bash
$ which git
/usr/local/bin/git
```

Why is mine different then? We can have an even better idea of what's
going on by using the `-a` option when using `which`:

```bash
$ which -a git
```

## Changing paths

Using a great package manager for OS X called
[Homebrew](http://brew.sh/) I installed my own version of Git because I
like to have control over the tools I use every day and update them when
necessary. I could update the system-installed Git from OS X but I have
no idea what other binaries or apps depend on it. More importantly, to
update it I would have to compile Git from source, and I'm just way too
lazy to do that.

Yes, this is a poor excuse because there are many ways to download
prepackaged versions of git that are easy to drop in, but bear with me,
this is where we get into the useful stuff.

We saw that the order of lookup for binary load paths was determined by
a file called `/etc/paths`, so why not change that order? Homebrew
installs all executable binaries into a directory called
`/usr/local/bin` in order not to step on the system's toes.

In `/etc/paths` that is the last directory loaded, which means the `git`
binary inside `/usr/bin` will take precedence over it, and my fancy new
version of Git will be ignored.

Now, you could succumb to evil ways and simply try to modify the order
in `/etc/paths` so that it suits your needs. In this case you would
simply have to put `/usr/local/bin` at the top and now the Homebrew-
installed version of git would load first. But despite how many times
you see this terrible advice repeated in StackOverflow discussions,
please don't do it. Configurations stored in `/etc/` are system-wide.
They're not there for your personal convenience and you could very well
damage way your computer functions by altering things in there. For all
you know some utility used by OS X could be relying on the original
order of `/etc/paths`. No, instead you should modify the `$PATH` in
*your* environment, using **your** `.bash_profile`. The one stored in
`/Users/yourusername/.bash_profile` also known as `~/.bash_profile`.

To ensure `/usr/local/bin` is looked into first, this is all you need to
include in your `.bash_profile`:

```bash
# inside ~/.bash_profile
export PATH=/usr/local/bin
```

This is exporting a new PATH environment variable by printing the
existing one and simply prepending the `/usr/local/bin` path on the left
of all other paths. After saving your `~/.bash_profile` and restarting
your shell, this is what you should see when calling `echo` on the
`$PATH`:

```bash
$ echo $PATH
/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
```

As you can see `/usr/local/bin` is mentioned twice in the `$PATH`, and
that's fine. Since it's mentioned first, all the binaries that will be
loaded the first time around will be ignored when it is visited last. I
honestly wish there was a safe and simple way to change the order of
paths. You could always override the default $PATH altogether but I've
rarely seen this done:

```bash
# inside ~/.bash_profile
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
```

## A fork in the path

Now that you've changed the `$PATH` to your liking, you can check that
the proper binary is being called when you use the `git` command:

```bash
$ which git
/usr/local/bin/git

$ git --version
git version 1.9.2

$ /usr/bin/git --version
git version 1.8.5.2 (Apple Git-48)
```

There you go. git 1.9.2 (the Homebrew-installed version) is now the one
answering `git` command and the Apple-installed 1.8.5.2 version recedes
in the background. If git 1.9.2 interferes with your system at all you
can simply uninstall it and the default version will take over
seamlessly.

## Protect your path

There is a host of utilities out there for developers (and designers)
that automatically inject code into your `.bash_profile` upon
installation. Often they don't even mention it to you, so if you find
odd paths listed in your profile, that may explain why loading a new
session (which happens when you open a new shell window or tab) takes
more time than it should: a bloated `$PATH` might take a while to load.

Here's my path today:

`/usr/local/heroku/bin:/Users/olivierlacan/.rbenv/shims:/Users/o
livierlacan/.rbenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr
/local/bin:/usr/local/MacGPG2/bin`

It's a little hard to read so I tend to break it into lines which can be
easily done with the `tr` command (translate characters):

```bash
$ echo $PATH | tr ':' '\n'
/Users/olivierlacan/.rbenv/shims
/Users/olivierlacan/.rbenv/bin
/usr/local/bin
/usr/local/heroku/bin
/usr/bin
/bin
/usr/sbin
/sbin
/usr/local/bin
```

There's a lot of stuff going on here, but it's much easier to understand
with some verticality. Try it out, and if you don't know why one of
those lines is in your `$PATH` then make it your goal to figure it out.
You might just learn something useful.