---
layout: post
title: "Security or Convenience?"
date: 2013-12-22 09:52
draft: true
---

Using two-factor authentication with web services is more crucial than ever because by now it should be evident to even the least savvy web users that [email is inherently insecure](http://security.stackexchange.com/a/30094) unless it's encrypted on the sending and receiving end.

Despite the great work of the team behind [GPGTools](https://gpgtools.org/) (which I covered in more detail [in my tools section](/tools/security/gpgtools.html)), personal encryption still requires a lot of user experience engineering and design improvements.

Once someone has access to your email account, it becomes trivial for them to trigger the password reset feature of the web services you use. If someone does this switfly, they can gain access to your accounts, reset passwords and lock you out. Whether they can retain your accounts for long is irrelevant, because they'll have access to your data in the meantime. This is why you should never store sensitive data on services that don't offer two-factor authentication, or even [basic SSL encryption](http://en.wikipedia.org/wiki/Secure_Sockets_Layer).

Here's a quick list of popular services for which you should go turn on two-factor authentication right now:
- [Google](https://support.google.com/accounts/answer/180744?hl=en)
- [Dropbox](https://www.dropbox.com/help/363/en)
- [Facebook](https://www.facebook.com/note.php?note_id=10150172618258920)
- [PayPal](https://www.paypal.com/us/cgi-bin?cmd=xpt/Marketing_CommandDriven/securitycenter/PayPalSecurityKey-outside&bn_r=o) (better yet, stop using PayPal)
- [Amazon AWS](http://aws.amazon.com/iam/details/mfa/)

I think personal security is important in light of such threats as [CryptoLockers](http://www.zdnet.com/cryptolockers-crimewave-a-trail-of-millions-in-laundered-bitcoin-7000024579/) just as much as passive and automated data backup solutions became no brainers in recent years thanks to the massive drop in remote storage costs. But there's something I find even more pressing and which doesn't seem to have registered yet, even with the largest and wealthiest companies on the planet: personal security bleeds over to company security.

At least in the tech industry, it's extremely common for workers to own their own machines, or at least take them home with them. Since operating system software and applications have become increasingly simple to use, these workers often use their machines for other purposes than work. It's completely unrealistic today to expect employees to use [air-gapped machines](http://en.wikipedia.org/wiki/Air_gap_(networking)), and yet the security threats we face are both much greater and more widespread.

Unless you want to wake up one morning to discover that [your database of hundreds of millions of customers has been leaked on the open web](http://www.theguardian.com/technology/2013/nov/07/adobe-password-leak-can-check) perhaps it's time you set some ground rules when it comes to security.

