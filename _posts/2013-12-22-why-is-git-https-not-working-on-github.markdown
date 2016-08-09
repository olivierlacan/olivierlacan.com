---
layout: post
title: "Why is Git HTTPS not working on GitHub?"
date: 2013-12-22 8:30
update: 2015-12-02 2:49
location: "Orlando, FL"
---

If you have no patience or aren't interested in my debugging process, skip to
the last section.

On September 3rd, 2013 GitHub [announced](https://github.com/blog/1614-two-factor-authentication)
a long awaited implementation of [two-factor authentication](http://en.wikipedia.org/wiki/Two-step_verification) on github.com.
Of course I immediately turned that feature on, and you should too.

## Authentication failed

After setting up 2FA on GitHub, I moved on and forget about it. I imagined that
my week would go on merrily, until one fateful day when I jumped into a repo and
this happened:

```
$ git pull
remote: Invalid username or password.
fatal: Authentication failed for 'https://github.com/codeschool/kraken.git/'
```

I clearly remembered pulling from this same repository without a hitch a few
weeks prior. How could my authentication suddenly fail. That damned
[osxkeychain credential helper](https://help.github.com/articles/set-up-git#password-caching)
felt like a perfect culprit, since I had issues with it in the past.

Strange. I definitely typed the correct password here.

Remembering that git has a way to talk to Keychain (the credential helper),
I thought maybe it had stored the wrong password so I checked the credential
helper for signs of life:

```
git config --global credential.helper
osxkeychain

$ git credential-osxkeychain
Usage: git credential-osxkeychain <get|store|erase>
```

Seemed all right. Maybe Keychain had the wrong password stored somehow?

## Keychain

After checking my own Keychain, there was indeed a record in there that
matched `https://github.com`:

![Screenshot of the Keychain app showing a github.com entry]({{ site.url }}/assets/keychain-github-record.png)

Since this obviously wasn't working I checked the info for that record:

![Screenshot of the Keychain app entry info for github.com]({{ site.url }}/assets/keychain-github-record-info.png)

It all checked out. The password was correct since **I had just logged into
github.com itself using it**. You can even see that the `git-credential-osxkeychain`
binary is allowed to access that credential from Keychain in the Access Control tab:

![Screenshot of the Keychain app entry info access control tab for github.com]({{ site.url }}/assets/keychain-github-record-info-access-control.png)

So it's not an access problem. What the hell is going on here?
I decided to delete the Keychain record for github.com and try to re-submit them.

```
$ git pull
Username for 'https://github.com': olivierlacan
Password for 'https://olivierlacan@github.com':
remote: Invalid username or password.
fatal: Authentication failed for 'https://github.com/example/thing.git/'
```

Still not a fan of my password, uh.

## It all makes sense now!

In a last effort, I googled the term "https github error" and found a GitHub Help
article on [HTTPS cloning errors](https://help.github.com/articles/https-cloning-errors).
Since cloning didn't work either, I thought it could be useful.
And that's when the answer [jumped at me](https://help.github.com/articles/https-cloning-errors#provide-access-token-if-2fa-enabled).

> If you have enabled two-factor authentication, **you must provide a personal
access token instead of entering your password for HTTPS Git**.
You can [create a personal access token](https://help.github.com/articles/creating-an-access-token-for-command-line-use)
for accessing GitHub by going to the [application settings page](https://github.com/settings/applications).

![It all makes sense now!]({{ site.url }}/assets/wee-bey.gif)

I willingly setup two-factor authentication on github.com and
expected that my single-factor password would still work to authenticate
through HTTPS via Git. And I probably glossed over some essential warning
copy while doing so.

![Screenshot of GitHub's Personal Access Tokens interface]({{ site.url }}/assets/github-personal-access-tokens.png)

Creating a [new Personal Access Token](https://github.com/settings/tokens/new)
on GitHub is easy and you get a hash to use as a password. **That** is what the
osxkeychain credential helper saves to use whenever you use HTTPS to clone or pull
GitHub repositories.

After the first prompt for credentials (on clone or pull), Git saves the credentials in
your Keychain and everything works as it's supposed to.

## Conclusion

Remember to make sure that you **do** have the keychain credential installed.
If you do, you should see this:

```
git credential-osxkeychain
usage: git credential-osxkeychain <get|store|erase>

# to configure git to use it:
git config --global credential.helper osxkeychain
```

If you don't have the credential helper installed or if you're using an operating
system other than OS X, read GitHub's new [Caching your GitHub password in Git](https://help.github.com/articles/caching-your-github-password-in-git/) guide.

Outdated credentials stored in Keychain Access for `github.com` can also cause issues.
GitHub now has a [guide on how to delete outdated credentials](https://help.github.com/articles/updating-credentials-from-the-osx-keychain/)
from either the Keychain Access interface or from the credential helper.

PS: I highly recommend using [GitHub's Hub](https://github.com/github/hub)
wrapper for Git since it allows you to clone repos with a simple
`git clone rails/rails` command. It automatically fetches the full HTTPS URL
for you and uses that for the origin remote.
