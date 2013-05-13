---
layout: post
title: "Launch Sublime Text 2 from the command line"
date: 2012-01-11 14:02
comments: true
categories: development
---

Sublime Text 2 ships with a [CLI](http://en.wikipedia.org/wiki/Command-line_interface) called `subl`. It's similar to the `mate` utility that is available for TextMate to open any file or folder straight from the command line. 

In Sublime, the utility is hidden in the application package, and assuming you installed Sublime in `/Applications` you can check that it's available on your system by running the commands below:

```
cd /Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/
ls
```

The only thing you should see displayed is `subl`. If not, go install the [latest version](http://www.sublimetext.com/2).

You can find more (official) documentation [here](http://www.sublimetext.com/docs/2/osx_command_line.html).

## Installation

_Note: These instructions assume you're using the Terminal app out of the box, without ZSH or any fancy prompts like that. I trust you will be able to adapt these instructions yourself if you do._

The official documentation I linked to above recommends creating a `~/bin` folder (in your home directory). That's weird, I don't recall ever being asked to do that on OS X since most people install binaries within `/usr/local/bin` which – if you're a developer – is likely to already have tons of other binaries.

So let's stay within the OS X conventions by doing:

```
ln -s /Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl /usr/local/bin/sublime
```

This will simply create a [symlink](http://en.wikipedia.org/wiki/Symbolic_link) called `sublime` (remember, we like names that don't suck to type 500 times a day) between the `subl` binary stashed in the Sublime application package, and a folder where your system usually looks for binaries to execute (launch). Think of it as a wormhole of awesome.

Now let's do a check to see if everything will run smoothly. Enter this:

```
open ~/.bash_profile`
```

You should see at the top of the file a line that starts with:
`export PATH=`

This contains all the directories that will be looked into for executable binaries when you type a command in Terminal. Since we create a symlink to `subl` called `sublime` in the `/usr/local/bin` directory let's check if this directory is listed on that same line. 

If it is, perfect. Let's keep going. If not, simply add it like this and save the file:

```
export PATH=/usr/local/bin:(...)
```

Note: The "(...)" in this example represents other folders that would be listed on the same line and separated by a colon.

If you had to add `/usr/local/bin` to your PATH, run the following command before continuing:

```
source ~/.bash_profile
```

This will reload your `.bash_profile` with the newly added directory.

## Testing

Open a Terminal window and run:

```
# replace <filename> by an actual file name
sublime <filename>
```

or

```
# replace "foldername" by an actual folder name
sublime <foldername>
```

or even

```
# to open the entire current directory
sublime .
```

## Conclusion

Now you don't need to get out of Terminal to simply open a file or a folder, you didn't have to add an "alias" or yet another bin directory to your `.bash_profile` which you would been have needed with the official instructions given by the Sublime team.

Have fun, Sublime is a great editor showing a lot of promise and you should check out the recent [beta release](http://www.sublimetext.com/2).