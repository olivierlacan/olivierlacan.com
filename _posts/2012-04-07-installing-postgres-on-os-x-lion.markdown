---
layout: post
title: "Installing Postgres on OS X Lion"
date: 2012-04-07 19:23
comments: true
categories: 
published: false
---

First, you should be using Homebrew. If not, go install it.

'brew install postgres'

## Auto Start

```bash
# If this is your first install, automatically load on login with:
  mkdir -p ~/Library/LaunchAgents
  cp /usr/local/Cellar/postgresql/9.1.3/homebrew.mxcl.postgresql.plist ~/Library/LaunchAgents/
  launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

# If this is an upgrade and you already have the homebrew.mxcl.postgresql.plist loaded:
  launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
  cp /usr/local/Cellar/postgresql/9.1.3/homebrew.mxcl.postgresql.plist ~/Library/LaunchAgents/
  launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
```

## Manual Start

```bash
# Or start manually with:
  pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start

# And stop with:
  pg_ctl -D /usr/local/var/postgres stop -s -m fast
```

In this case it's a great idea to use a TextExpander shortcut to this command so you don't have to remember it. For instance, map `pppgstart` to the manual start command and `pppgstop` to the stop command.

## The pg gem

Because the pg gem requires native extensions to be compiled when you install it, it will use the instance of postgres that responds to `psql`, and on OS X there's a good chance this isn't the postgres you installed with Homebrew but rather the system default which you don't want to use.

Run `which psql`, if the result isn't `/usr/local/bin/psql` you're going to need to put `/usr/local/bin/` a bit earlier in your PATH so that the `psql` command calls on the Homebrew version instead.

Here's an example of my PATH:

```
export PATH=/Users/olivierlacan/.rbenv/shims:/Users/olivierlacan/.rbenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:bin/
```

Note that /usr/local/bin is before all the other bin directories (except those from rbenv, could be RVM if that's what you use).