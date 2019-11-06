---
title: cd is Wasting Your Time
layout: post
date: '2018-03-26 17:34'
update: '2018-03-27 19:08'
location: "Paris, France"
categories: development
image: cd_is_wasting_your_time.jpg
---
$$p^{2}=25$$ শলভ কয়রও
As a programmer or someone who spends a lot of time in command line
shells, it's likely that you regularly move around directories in ways
that might feel less than efficient. Especially if you often visit the
same directories every day.

The routine probably goes a bit like this:

```bash
cd ~/Development
ls # look around...
cd project
# whoops, never mind, let's go back...
cd ..
# time to start something new...
mkdir new_project
cd new_project
# need to check something in that other directory...
cd ../project
```

Maybe with a bit more experience, you have some tab-completion tricks up
your sleeve to avoid typing these full directory names, so in reality it
looks more like:

```bash
cd ~/Dev<TAB>
ls # look around...
cd pro<TAB>
cd ..
mkdir new_project
cd new<TAB>
cd ../pro<TAB>
```

Great. You saved about 20 keystrokes. That's commendable. Yes, you could
also use the return value from the `mkdir` command to immediately move
into the newly created directory (`cd !$`). And you could just remember
that `project/` is nested inside `Development/` so that you don't need
to `ls` around to find your way. The reality is that people are not
computers and memorizing your entire directory's tree structure is a
trick that only impresses people who far too much time on their hands.

But what about this?

```bash
j d
j p
cd ..
mkdir new_project
cd new<TAB>
j p
```

The most obvious benefit is that this took 18 fewer keystrokes to
accomplish the same goals but what may not be so obvious is that the `j
d` (or `j dev`, `j develop`, etc.) command will now take you to
`~/Development/` and `j p` to `~/Development/project` from anywhere
inside your filesystem. So this relatively small gain in typing
efficiency will compound with time.

```bash
cd /usr/local/lib/something/log/
j p
pwd
~/Development/project
```

How does it work? [AutoJump][aj]

AutoJump is magic cape that lets you fly around directories in your
command line. The official description of the tool is "a faster way to
navigate your filesystem" — but that doesn't quite do it justice. It a
bit of an undersell. My **completely made up** estimate is that Autojump
has saved me from at least a whole year of typing. At the very least
that's how it feels.

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

[aj]: https://github.com/wting/autojump
[fuzz]: https://en.wikipedia.org/wiki/Fuzzy_matching_(computer-assisted_translation)
[linux]: https://github.com/wting/autojump#linux
[git]: https://github.com/wting/autojump#manual
