---
layout: post
title: "cd is Wasting Your Time"
date: 2018-03-26 17:34
location: "Paris, France"
categories: development
---

As a programmer or someone who does things with computers in command
line shells, I bet you regularly do things like this:

```bash
cd ~
cd Development
cd project
cd ..
mkdir new_project
cd new_project
cd ../project
```

I'm sure you're aware that moving through directories this way is far
less efficient than using a graphical user interface (GUI). But maybe
you have some tab-completion tricks up your sleeve to avoid typing these
full directory names, so in reality it looks more like:

```bash
cd
cd Dev<TAB>
cd pro<TAB>
cd ..
mkdir new_project
cd new<TAB>
cd ../pro<TAB>
```

Great. So you saved 20 keystrokes (24 characters replaced by 4
invocations of the `TAB` key). That's pretty good. How about this:

```bash
cd
j d
j p
mkdir new_project
cd new<TAB>
j p
```

That's 9 fewer keystrokes to accomplish exactly the same commands. How
does it work? AutoJump

AutoJump is magic cape that lets you fly around directories in your
command line. The real description of the tool is "a faster way to
navigate your filesystem" — but that doesn't quite do it justice. It's
such an undersell. My made up estimate is that Autojump has saved me
from at least a whole year of typing. At least that's how it feels.

## How Autojump works

This command:
```bash
j project
/Users/olivierlacan/Development/project
```

Works just the same as this command:
```bash
j p
/Users/olivierlacan/Development/project
```

Why? Because AutoJump remembers all of the directories you move
into with the `cd` command or with its own `j` command. And more
important, AutoJump does [fuzzy matching][fuzz]. Meaning it will look
for a directory you've visited before that contains the same string of
letters you provide, even if you only provide one letter.

What if you have two directories that start with the letter `p`? That's
where it gets interesting.

The first time you type `cd directory_name`, Autojump logs the absolute
path to that directory and assigns it as weight (or rating) of `10.0`.

So if you do:

```bash
cd /var
```

You will see the following in the `j -s` command (`s` stands for "stats"):

```
10.0: /var
```

What if you visit `/var` again?

```
14.1: /var
```

And so on. If you visit a directory often the rating for that directory
will increase. In my case, you can easily guess what I spend most
of my time doing by looking at my top 5:

```bash
j -s

(...)
234.7:  /Users/olivierlacan/Development/cs/campus
262.7:  /Users/olivierlacan/Development/rubyheroes/rubyheroes.com
417.4:  /Users/olivierlacan/Development/perso/orientation
874.1:  /Users/olivierlacan/Development/cs/CodeSchool
________________________________________

10810:   total weight
198:   number of entries
0.00:  current directory weight

data:  /Users/olivierlacan/Library/autojump/autojump.txt
```

Since both my first (`CodeSchool`) and fourth (`campus`) directories
contain the letter `c`. How does AutoJump decide where to go? Once again,
the rating.

Since `campus` has a much lower rating, AutoJump will first take me to
`CodeSchool`. However, if I repeat the `j c` command, it will try the
next highest rated directory that matches the letter `c`.

```bash
j c
/Users/olivierlacan/Development/cs/CodeSchool
j c
/Users/olivierlacan/Development/cs/campus
```

If you don't like to fly blind and assume AutoJump will make the right
choice for you, it's also possible to see what directories match a
specific string of letters you provide:


```bash
j c<TAB><TAB><TAB>
$ j c__
c__1__/Users/olivierlacan/Development/cs/CodeSchool
c__2__/Users/olivierlacan/Development/cs/campus
c__3__/Users/olivierlacan/Development/perso/keep-a-changelog
c__4__/Users/olivierlacan/Development/perso/olivierlacan.com
$ j c__4
/Users/olivierlacan/Development/perso/olivierlacan.com
```

After display a numbered list of directories that match the supplied
argument, AutoJump will prefill the command `j c__` and let you type
the number for whichever directory you which to jump to.

## Advanced Features

- the `jc` (child) command will scope the search to only subdirectories
  of the current directory, which is very useful to find nested `log`
  directories.
- the `jo` (open) command will open the matched directory in your
  operating system's file manager.
- the `j -i` command will increase the weight of the current directory.
- the `j -d` command will decrease the weight of the current directory.
- the `j --purge` command will wipe the weighted list of directories
  AutoJump relies on if you need to start from scratch.

## Installing AutoJump

While AutoJump does require Python, it's such a simple tool supported by
most shells (bash, zsh, fish) that you can install AutoJump via many
[Linux package managers][linux]. For macOS I recommend Homebrew's `brew
install autojump` which couldn't be simplier although do remember that
you have to source AutoJump in your `.bash_profile` or `.zshrc` by
adding the following line:

```bash
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
```

It checks that the AutoJump script is available and simply loads it in
your shell.

You can also clone the git repository and use the manual [installation
procedure][git] if you want to stay on the bleeding edge but it's an
incredibly stable tool thanks to its simplicity. I don't think I've
encountered a single bug in years of usage.

[fuzz]: https://en.wikipedia.org/wiki/Fuzzy_matching_(computer-assisted_translation)
[linux]: https://github.com/wting/autojump#linux
[git]: https://github.com/wting/autojump#manual
