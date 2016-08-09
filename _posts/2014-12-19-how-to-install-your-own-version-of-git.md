---
layout: post
title: "How to Install Your Own Version of git"
date: 2014-12-19 17:59
location: "Paris, France"
categories: development
---

Yesterday, a [pretty serious security vulnerability was revealed](https://github.com/blog/1938-vulnerability-announced-update-your-git-clients) which affects all versions of git.

You should upgrade to one of the maintenance releases described in the
link above, but that's assuming you can.

A lot of people don't know how to do that. A lot of people are using the
git version that ships with Apple's OS X or their operating system of
choice. I can't help you if you use Windows or Linux but head over to the
[Downloads section of the official git website](http://git-scm.com/downloads) for help.

Now if you use OS X, and if you use git regurlarly like many people who
build websites and software, you now may understand why people like me
recommend against using the software packages that are bundled with
operating systems like OS X:

- The versions are often very old.
- It's either hard or impossible to upgrade them without the operating
  system vendor.
- Operating sytem security updates don't always update these packages,
  or at least not promptly.

## git your own

First step to controlling your development software,
[install Homebrew](http://brew.sh/). It's a package manager.
It works similarly to the App Store — but on the command line.

So first open the Terminal app. `Command` + `Space` to open Spotlight
and just type `Terminal` if you don't know where it is. You should see
something like this:

![Terminal]({{ site.url }}/assets/terminal.png)

Now I'm curious if you already have Homebrew installed. We can be sure
by using the `which` command like this:

```bash
which brew
/usr/local/bin/brew
```

If you don't see `/usr/local/bin/brew` displayed when you press `Enter`
after entering the command, you don't have Homebrew installed.
So let's do that.

**WARNING**: I'm about to tell you to do something dangerous.
Downloading and executing an unknown and potentially nefarious script
whose source code you've never read. You **should not** do this willy
nilly. The only reason I ask you to trust me is that I trust this
specific script. It's written in Ruby. I've read it. And I'm mildly
confident no one has hacked my blog to replace the link with a nefarious
one.

In any case, you can find the source code of the script right here: [https://raw.githubusercontent.com/Homebrew/install/master/install](https://raw.githubusercontent.com/Homebrew/install/master/install)

Paste the following command in your Terminal window and press `Enter`:

```bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Once the installation is over, I recommend you run the following command:

```bash
brew doctor
Your system is ready to brew.
```

Homebrew can't heal itself but it can diagnose anything on your system
that may hinder its functioning. Usually that will involve installing a
version of Xcode which you can now simply find on the App Store.

Whenever `brew doctor` answers with `Your system is ready to brew.`, you're
ready to install git. Just run:

```bash
brew install git
```

Once you do, I suggest you quit (`Command` + 'Q') the Terminal app. I
don't say this because restarting the app magically makes everything
works right. It's because we installed a new binary and it may not be
available on the load path immediately. You can check that by running:

```bash
which -a git
```

This command looks for all available binaries matching the name `git`
anywhere on your load path (`$PATH`). Whereas `which git` will only tell
you the one which will be used to answer calls to git. The first directory
path in the list will be the one used. If you see `/usr/local/bin/git` at
the top, congratulations, you've installed your own git. You can check
the version of the git you installed with `git --version`.
It should be higher than `2.2.1`.

If `which git` yields `/usr/bin/git` then the Apple-installed git is still
taking precedence over the one we just installed with Homebrew. That's
completely normal and okay. It just means we have a wee bit of work left to do.

Let's talk about your `$PATH`. The reason why you're seeing the Apple-installed
version respond first is because of that loading path. I've written a long
piece for [A List Apart on this topic if you care to learn more](http://alistapart.com/article/the-path-to-enlightenment) but if you want to get it over with quick, let's do this:

```bash
echo $PATH | tr ":" "\n"
```

This should list all the paths in your load path in order of precedence.
For you, I can bet that `/usr/local/bin` is showing up *below* `/usr/bin`.

All we need to do is **prepend** the `/usr/local/bin` path in the load
order.

First run these commands:

```bash
cd
ls -a | grep bash
```

The first command takes you to your home directory wherever you are.
It's a neat trick to quickly go home without having to type anything else.

The second command lists all directory contents including dotfiles (`-a`)
and then filters the list of returned files and directories to only show
the ones which have the word `bash` inside them.

Mine only outputs:

```bash
.bash_history
.bash_profile
```

If you have a `.bashrc` file it's likely you created it following someone's
advice on the internet. Check to make sure it doesn't contain path modifications:

```bash
cat .bashrc
```

If you don't see anything that ressembles `PATH=` then you're fine,
otherwise I recommend you put all your path modifications in the same
place. I put mine in `.bash_profile`. If you want to read more about
configuration files, I recommend [this](http://superuser.com/questions/789448/choosing-between-bashrc-profile-bash-profile-etc) and [that](http://superuser.com/questions/789448/choosing-between-bashrc-profile-bash-profile-etc) StackOverflow discussions.

Here's how to modify your path to prepend the `/usr/local/bin` directory:

```bash
export PATH="/usr/local/bin:$PATH"
```

Make sure to put that near the top of your `.bash_profile` and annotate
it with a note about its purpose so you can understand it when you find it
later. I often leave links to the resources I've used, like this blog
post, so I can understand why I modified my configuration later.
