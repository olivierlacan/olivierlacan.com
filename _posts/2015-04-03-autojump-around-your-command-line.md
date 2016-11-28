---
layout: post
title: "Autojump Around your Command Line"
drafted: 2015-04-03 8:40
date: 2016-10-17 9:20
location: "Paris, France"
categories: development
draft: true
---

Pairing with someone for the first time is always exciting for me. It used to be
an anxiety-inducing experience even to think about it. That's when I was still
convinced that my pairs would discover that I had no idea what I was doing.
Thankfully, that dreaded moment hasn't happened yet. Or at least no one told me
they thought I was a fraud so I'll keep pretending I have it under control.

Much to my surprise, I didn't get fired right after my first pairing session.
After a while, I found solace in the fact that if I had been so *shockingly bad*
my pair might have taken the time to tell someone how much I sucked. Or at
least take me aside and tell me to get my shit together.

Even a few years ago, when I was far less experienced, there was always a phase
at the beginning of pairing session where I'd have to watch someone I respected
or even looked up to do things like this:

```bash
cd ~
cd Development/
cd project/
cd ..
mkdir new_project
cd new_project/
cd ../project
```

After a few seconds of watching this, an irresitible urge would take over and 
I would suddenly blurt out:

> Do you know Autojump?

Most of the time, the response was negative. Assuming you don't either, here's 
what Autojump is: a cape that lets you fly around directories.

See I could have given you the official description of this tool — "a faster way to navigate your filesystem" — 
but that would be criminal. It's such an undersell. There are some tools like 
TextExpander which keep a running tab of the keystrokes they have saved you from 
typing. My rough estimate is that Autojump has saved me from about a whole year 
of typing.

## How Autojump works

```bash
j project
/Users/olivierlacan/Development/project
```

That's it. Doesn't matter where you are. Your home directory, some deeply nested
nested log directory, anywhere. But what if you have two `project` directories 
in different areas of your filesystem? That's where it gets really good.

Every single time you type `cd directory_name`, Autojump logs the expanded 
absolute path to the directory_name. The one you see inside of it when you type 
`pwd` (print working directory). 

Autojump doesn't only log that path, it also gives it a rating. By default, the 
weight is `10.0`. So if you do:

```bash
cd /var
```

You will see the following in `j -s` (for "stats"):

```
10.0: /var
```

What if you visit `/var` again?

```
14.1: /var
```

And so on. If you visit a directory often, either through the good old `cd` or
by using Autojump's `j` command, the rating of that directory will slowly
increase. In my case, you can easily guess what I spend most of my time doing 
by looking at my top 5:

```bash
j -s

(...)
234.7:  /Users/olivierlacan/Development/cs/campus
262.7:  /Users/olivierlacan/Development/rubyheroes/rubyheroes.com
417.4:  /Users/olivierlacan/Development/perso/orientation
761.2:  /Users/olivierlacan/Development/cs/SchoolOfCode
874.1:  /Users/olivierlacan/Development/cs/CodeSchool
________________________________________

10810:   total weight
198:   number of entries
0.00:  current directory weight

data:  /Users/olivierlacan/Library/autojump/autojump.txt
```

I forgot to mention something pretty important. Autojump does fuzzy matching, 
and the highest-rated directories win. What does that mean? Well, look a my 
top-rated directory: `/Users/olivierlacan/Development/cs/CodeSchool`.

You *could* jump there by doing:

```bash
j CodeSchool
/Users/olivierlacan/Development/cd/CodeSchool
```

But doesn't that upper and lower case business look tedious? You get it.

```bash
j c
/Users/olivierlacan/Development/cd/CodeSchool
```
