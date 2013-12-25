---
layout: post
title: "Why is Git HTTPS not working on GitHub?"
date: 2013-12-22 8:30
---

I'm glad you ask. I've been pondering that question sporadically for the past few months and I finally have an answer. I'm ashamed how obvious it eventually was. If you have no patience or aren't interested in my debugging process, skip to the last section.

On September 3rd, 2013 GitHub [announced](https://github.com/blog/1614-two-factor-authentication) a long awaited implementation of [two-factor authentication](http://en.wikipedia.org/wiki/Two-step_verification) on github.com. Of course I immediately turned that feature on, and you should too.

## Authentication failed

After setting up 2FA on GitHub that day, I moved on and proceeded to completely forget about it. Innocently I imagined that my week would go on merrily, until one day I jumped into the local repo for one of the Rails apps we use at [Code School](https://codeschool.com) and this happened:

```
$ git pull
remote: Invalid username or password.
fatal: Authentication failed for 'https://github.com/codeschool/kraken.git/'
```

Hmmm. What? I clearly remembered pulling from this same repository without a hitch a few weeks prior. How could my authentication suddenly fail. That damned [osxkeychain credential helper](https://help.github.com/articles/set-up-git#password-caching) felt like a perfect culprit, since I had issues with it in the past.

I checked the credential helper for signs of life:

```
$ git credential-osxkeychain
Usage: git credential-osxkeychain <get|store|erase>
```

Seems right. But does it actually work? I'll admit I never tried any of those commands.

```
$ git credential-osxkeychain get


```

## Diving into git credential-osxkeychain

The blank line is actually what happens here. This command hangs. At first I think that it's the helper itself bugging out so I go through GitHub's [Set Up Git tutorial](https://help.github.com/articles/set-up-git#password-caching) again and reinstall the credential helper from scratch.

No dice. It still hangs on the `get` command. So I try to hit `Enter` while the command is hanging, and this happens:

![Screenshot of the Keychain asking about a random credential stored in my keychain](/images/osxkeychain-credential-helper-keychain-prompt.png)

Why is this thing asking about an outlook.com credential? Well thanks to GitHub Supportocat [Petros Amiridis](http://amiridis.net/) who was kind enough to explain this in detail to me, I can explain.

The osxkeychain credential's get command won't work because it expects a set of filters in order to attempt to "get" a record inside of Keychain. Those filters are provided by whenever you use a normal command like `pull` or `clone` and are the following:

```
protocol=https
host=github.com
```

When no filters are provided -- which is what happens when you call `git credential-osxkeychain get` directly -- it can't find any match. Pressing `Enter` simply attempts to `get` the first item from your Keychain, whatever it is. In my case, it happened to be those outlook.com credentials.

## Keychain

After checking my own Keychain, sure enough, there was a record in there that matched `https://github.com`:

![Screenshot of the Keychain app showing a github.com entry](/images/keychain-github-record.png)

Since this obviously wasn't working I checked the info for that record:

![Screenshot of the Keychain app entry info for github.com](/images/keychain-github-record-info.png)

It all checked out. The password was correct since **I had just logged into github.com itself using it**. You can even see that the git-credential-osxkeychain binary is allowed to access that credential from Keychain in the Access Control tab:

![Screenshot of the Keychain app entry info access control tab for github.com](/images/keychain-github-record-info-access-control.png)

So it's not an access problem. What the hell is going on here?
I decided to delete the Keychain record for github.com and try to re-submit them.

```
$ git pull
Username for 'https://github.com': olivierlacan
Password for 'https://olivierlacan@github.com': 
remote: Invalid username or password.
fatal: Authentication failed for 'https://github.com/codeschool/kraken.git/'
```

Still not a fan of my password. After checking Keychain I noticed something: probably because of the "Invalid username or password" error, the credentials I entered weren't saved in Keychain. I clearly remember them appearing in Keychain after the first time I setup git credential-osxkeychain.

## It all makes sense now!

In a last effort, I googled the term "https github error" and found a GitHub Help article on [HTTPS cloning errors](https://help.github.com/articles/https-cloning-errors). Since cloning didn't work either, I thought it could be useful. And that's when the answer [jumped at me](https://help.github.com/articles/https-cloning-errors#provide-access-token-if-2fa-enabled).

> If you have enabled two-factor authentication, **you must provide a personal access token instead of entering your password for HTTPS Git**. You can [create a personal access token](https://help.github.com/articles/creating-an-access-token-for-command-line-use) for accessing GitHub by going to the [application settings page](https://github.com/settings/applications).

![It all makes sense now!](/images/wee-bey.gif)

There you go. I willingly setup two-factor authentication on github.com and expected that my single-factor password would still work to authenticate through HTTPS via Git. And I probably glossed over some essential warning copy while doing so.

![Screenshot of GitHub's Personal Access Tokens interface](/images/github-personal-access-tokens.png)

Creating a [new Personal Access Token](https://github.com/settings/tokens/new) on GitHub is easy and you get a hash to use as a password. After the first prompt Git gives you when you attempt to clone or pull, the credentials are saved in your Keychain and everything works as it's supposed to.

PS: I highly recommend using [GitHub's Hub](https://github.com/github/hub) wrapper for Git since it allows you to clone repos with a simple `git clone rails/rails` command. It automatically fetches the full HTTPS URL for you and uses that for the origin remote.

