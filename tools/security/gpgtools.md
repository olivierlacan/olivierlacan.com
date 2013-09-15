---
layout: tool
date: 2013-06-06 0:00
title: GPGTools
categories: security
---

# [GPGTools](gpgtools.org)
Email is unsafe, it's a harsh realization that took way too long to hit the mainstream. And I'm not sure most people fully understand that email is just plain text and that it is sent over Wi-Fi networks as plain text, which means that anybody who can snoop (by simply being connected to the same network while you send or receive) your network can litterally read your emails.

If you've ever sent a password or sensitive information to your co-workers or to your family via email, you should assume that data could have been accessed. It might be chilling, but it's basically as secure as snail mail, which you left in a mailbox for hours before it was picked up by a post office worker whose trustworthiness you took for granted. Your letters were then transfered to a distribution center with varied levels of security and surveillance, within which prying eyes could very well have looked at your private communications.

GPGTools allows you to seamlessly encrypt and decrypt email messages within Apple's Mail.app with people you trust by using a private & public key pair just like Git does. It will encrypt your messages using the private key the app allows you to generate, and only the people who you send your public key to will be able to read the contents of your messages.

That poses an original conundrum which I haven't solved myself. If unencrypted email cannot be trusted, how the hell do you send your public key to someone in a secure fashion. Handing them a USB drive physically seems the most obvious answer, but that doesn't solve the issue of people you can't physically meet. Please shoot me an email if you have any idea how to do that securely.

Make sure to read [GPGTools' Quickstart Guide](http://support.gpgtools.org/kb/how-to/first-steps-where-do-i-start-where-do-i-begin) after you install the suite. They're planning on improving the GPG Keychain Access app in the near future and revamp this guide but it remains the best place to get started for now.

I know that I recommend [Airmail](/tools/communication/airmail.html) as a communication tool, but while Mail.app can be more secure when used in conjunction with GPGTools, it's user interface is leagues behind that of Airmail. As long as you have to sensitive information to discuss or credentials to share, I would recommend sticking with Airmail for most email jobs.