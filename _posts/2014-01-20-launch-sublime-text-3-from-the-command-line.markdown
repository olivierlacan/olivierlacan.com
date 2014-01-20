---
layout: post
title: "Launch Sublime Text 3 from the command line"
date: 2014-01-20 15:00
categories: development
---

Sublime Text 3 ships with a [CLI](http://en.wikipedia.org/wiki/Command-line_interface) called `subl`. By default you can't use this command line utility unless you do some fiddling. 

## A word about the load $PATH

The [Sublime Text documentation](http://www.sublimetext.com/docs/3/osx_command_line.html) on this tool does explain where it's located (`/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl`) but it assumes you have `~/bin` (or `/Users/username/`) in your load path (`$PATH`) which is downright silly. There's a better way.

The `/usr/local/bin` is in the load path by default on OS X, so it's a much better place to symlink (create a [symbolic link](http://en.wikipedia.org/wiki/Symbolic_link) — or shortcut) that will allow you to run the `subl` utility from your Terminal app.

First up, check your own `$PATH` by running: `echo $PATH`. This is what mine returns:

```
/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
```

As you can see the `/usr/local/bin` path is included by default on OS X.

## Installation

_Note: These instructions assume you're using the Terminal app out of the box, without ZSH or any fancy prompts like that. I trust you will be able to adapt these instructions yourself if you do._

```
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/sublime
```

Yes, I name the symlink `sublime` instead of `subl` because I believe you should always be explicit. You should never have to type the full word anyway. Typing `sub` + `Tab` should auto-complete the full name of the symlink. 

## Testing

Open a Terminal window and run:

```
sublime ~/Documents
```

or

```
cd
sublime Documents/
```

or even

```
# to open the entire current directory
sublime .
```

## Conclusion

Now you don't need to get out of Terminal to simply open a file or a folder, you didn't have to add an "alias" or yet another bin directory to your `.bash_profile` which the official instructions given by the Sublime team seems to recommend.

Have fun, Sublime is a great editor. Check out the most recent [beta release of Sublime Text 3](http://www.sublimetext.com/3).