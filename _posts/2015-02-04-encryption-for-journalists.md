---
layout: post
title: "Encryption for Journalists"
date: 2014-02-04 17:59
location: "Paris, France"
categories: security
draft: true
---

On Sunday, January 6th 2013, ["anon108" uploaded a video on Vimeo](https://vimeo.com/56881481)
explaining the basics of encryption using a Windows tool called [gpg4win](http://gpg4win.org/)
in the context of a journalist/informat relationship. This anonymous
uploader was of course none other than Edward Snowden. He can be
recognized today despite the audio scrambling used to summarily disguise
his voice.

This video was most likely created to help Glenn Greenwald (at the time
with The Guardian) use encryption so that Snowden could communicate
securely with him without compromising his identity or safety. It
eventually took Laura Poitras' assistance for Greenwald to step up his
operational security game but I believe this tutorial — however flawed —
is an important tool to help journalists around the world understand the
what they and their informants face when it comes to the ever prying ears
of governments and other enemies of the free press.

My eventual goal is to create a new version of this video tutorial with
a more intelligible voice over, and a version geared toward Mac users.

You can find the transcription below the video.

<iframe src="//player.vimeo.com/video/56881481?title=0&byline=0&portrait=0" width="675" height="379" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>

## Description
These are basic instructions on how to protect Source-Journalist
communications from being intercepted and read when they transit the
Internet using a technique called Public Key Encryption (PKE). By
following these instructions, you'll allow any potential source in the
world to send you a powerfully encrypted message that **only you** can
read even if the two of you have never met or exchanged contact
information.

We'll be using GNU Privacy Guard (GPG) through the "gpg4win" front-end
program and focusing on emails as the transmission medium, but once
you've created your ciphertext, you could send it any way you want:
email, IM, blog post, Skype, etc.

Recommended public keyservers include:
- pgp.mit.edu
- keys.gnupg.net
- sks-keyservers.net

## Video Transcript
Before we get into the tutorial proper, let's get a brief overview of
the problems we're looking at when discussing source-journalist
communications where you have someone with information that they'd like
to get to the journalist over here but they have to transit the Internet
somehow which is an untrusted environment. Particularly for email which
is unencrypted by default. Any router you cross can be monitored by an
intelligence agency or other adversaries — a random hacker. So could any
endpoints on the way there: a mail server or a service provider such as
Gmail.

An aside on that, if the journalist uses a webmail service personally or
it's provided by their company, that can be plaintext and that email can
always be retrieved later on via subpoena or some other mechanism —
legal or illegal — instead of catching it during transit. So that's
doubly dangerous if it's on the journalist's home PC.

But the solution to that is to actually encrypt the message. Now one of
the problem with encryption typically is that it requires a "shared
secret" for a key or a password between the journalist and the source
but if the source sends an encrypted file across the Internet to the
journalist that says "Hey, there's an encrypted file. The password is
'cheesecake'." The Internet's going to know the password was
"cheesecake" and in transit they'll know.

### Public Key Encryption
Public key encryption — such as GPG — allows the journalist to publish a
key that anyone can have based on the design of the algorithm, and it
doesn't provide any advantage to the adversary because the source has
something called a private key of his own that the journalist doesn't
need any knowledge of. That will allow him (the source) to encrypt a
message specifically to the journalist [using the journalist's public
key]. He can then send his message that would look like this (points to
plain text message) — which is obviously a bad idea — and make it look
more like this (points to encrypted PGP message block). And he'll send
that across the internet along with a copy of his public key so the
journalist can respond and when it arrives at the journalist he (the
journalist) can decrypt it at his leisure to see exactly what he was
saying and it's entirely secure.

That is, secure *in transit* and *at rest*. However access to the
plaintext can still be gained by exploiting the correspondents'
computers directly, as discussed later.

With some of the typical algorithms like RSA — they're used by GPG,
they've won basically cracking challenges, a mathematical factorializing
challenge. Since 1991. It ended in 2007 with [inaudible] who's actually
claimed the prizes for key sizes that are commonly seen, and it has
never been broken — at typical key lengths.

"At typical key lengths" being the important phrase. Always select the
strongest key you can (for RSA, use more than 2048 bits).

Which means that over the course of the last twenty years it has had an
unbroken record of security success. It's been peer reviewed by leading
mathematicians. So that's a solid margin of security and reasonable to
rely on that.

You can still have problems with GPG if your certificate — not your
public key — something you call a private key, is lost. At airport
security, GCHQ in the UK, if somebody takes your laptop, gains access to
it, steals your certificate and then also compromise the passphrase —
the password that you use to secure that certificate — then they can
read anything that was encrypted.

In the UK, remember that their government considers withholding a
cryptographic passphrase to be a crime under their RIPA law.

Obviously, that requires a lot more effort than simply monitoring
everything that transits in clear text over the Internet. Or going up
and knocking on Gmail's door and going "Please turn over your documents
regarding this person".

Or just doing it the easy way and sending the journalist a trojaned
pdf/doc/etc. file to gain admin access to their machine.

So with that, let's continue on with the rest of the tutorial.

### gpg4win
Alright, so the first thing we're going to do is to go to [gpg4win.org](http://gpg4win.org/) to
download the package. Click the big download button. Get the latest
version, right now it's  beta. There's a full installer and the
signature. Click "Full Installer".

You download this. I've already gotten a copy for this demo. Just click
"Save File" to finish. Go to the location. It should look like something
like this. [shows Local Disk (C:) > temp, presumably content of the full
installer archive]. Double click it.

Note: the .sig files are used to determine file integrity, that is, to
ensure the installer you downloaded does not have a trojan or anything
else malicious bound to it. In places like Syria and former Lybia this
really does happen.

It's probably going to be a "next, next, next" installer but there are a
couple of gotchas. "License", next. There are two agents for use:
Kleopatra and GPA. GPA is unclicked but I could click GPA. Make sure you
have both. The other one is GPG for Outlook. You don't need that unless
you use Outlook. Designated Path is next. Next. Next. This won't happen
for you. I already have a copy installed. But you'll wait for it to
install.

After it's finished click next. You've got to acknowledge this screen.
It's for a corporate setting. It implies that you trust. [Shows line in
Define trustable root certificates and highlights "If you trust the root
certificate therby you trust also all underlying certificates."] You
don't want this but it's not enabled by default. Just acknowledge and
click "Next" and you're finished.

Okay, installation's complete. Let's start the program. You have two
choices: Kleopatra or GPA (for GNU Privacy Assistant). You want GPA.
It's better in almost every way even though it's older.

Kleopatra will always be an option if you prefer it, but generally GPA
is easier to use and less "bossy".

This is the interface. Your keys. [shows the Keys menu].

You'll be prompted to create a key as soon as you open the program for
the first time but **do not do so** until you have enabled "advanced
mode" so you can generate a 3072 bit key instead of the weaker 2048
default.

First thing you need to do as a new user is go to Preferences and click
"Use advance mode". If you *don't* click this and it's not enabled by
default, you won't be able to chose your key length. You want a key that
is stronger than the default length.

### Generating a key
Then you go into Keys > Generate key. Pick a key size of 3072 instead of
2048. Enter information to be associated with the certificate. This is
going to be published with the key. It's important to have accurate
information for the journalist. For others you can really enter anything
in there.

They're going to have to create a password. The only things that protect
the security of the communications are the passphrase and the strength
of the certificate itself. The certificate won't be broken but the
passphrase could be broken using a dictionnary attack or a brute force
attack, anything like that.

The takaway from the password caution should be: use memorable long,
strong passwords.

"I hateses all kinds of YELLOW #5" is memorable and would require 65.53
trillion trillion trillion centuries to attack via brute force.

Intentional, personal, and memorable typos are a good way to prevent
dictionary attacks. "MARGARET THATCHER is 110% sessy" is stronger than
"110% sexy".

So use something strong. Pick out a memorable quote that you don't have
to write down that's meaningful to you and no one else knows like
"Margaret Thatcher is 110% sexy".  That has special characters like the
"%" sign; numbers, uppercase and lowercase letters; and is very long.
Your needs more than 20 characters minimum.

### Sharing your key
So our key is finished generating. We have a new one right there. Once
you've generated your key we need to share it. We send them to key
servers. That's where anyone can get keys. Public keys, not private
keys. Server, "Send Keys...".

[keys.gnupg.net](http://keys.gnupg.net) is a good one. That's the common
default from the makers of the program. Just click "Yes". It's sending
the keys out there. Now people can search by your email address, your
name, or the fingerprint of the key which we'll get to later.

Let's take a quick look at publishing and getting keys from people we've
never had contact with. [pgp.mit.edu](http://pgp.mit.edu) is a public key server. Anyone can
put their keys up there for free.

### Keyservers
Keysevers like [pgp.mit.edu](http://pgp.mit.edu) are an important method of Public Key
distribution. This ensures a source doesn't compromise their identity in
trying to make initial contact with you.

Important: Be aware that once you have uploaded a key to a keyserver,
you cannot take it back down unless you generate a "revocation
certificate". You can do this through GPA. If you've lost your key, you
can't do it anymore. So do this in advance and store the revocation
certificate someplace safe.

You can search by emails. You want to use exact matches if you know what
the email is.

This is what results look like. This is the key we just generated and
published. That is our key ID, which are the last 8 characters of the
fingerprint.

"Key ID" is the name of the last 8 characters of your key's hexadecimal
fingerprint. These last 8 characters are unique enough that if you want
someone to be able to search for your key, you can just provide them
those 8 characters.

When you need to share this or get this from someone else it will look
like this long block of gibberish. Start with `BEGIN` and `END PGP PUBLIC KEY BLOCK`.
Just copy that, go to GPA. Hit `Control` + `V` on your
keyboard to paste. It will import the key. We already have it here so
it's not actually going to pop up.

You can tell whether these gibberish blocks are public keys (shared to
enable encryption) or ciphertext (the actual encrypted messages
themselves) by the begin/end blocks.

Keys say `PUBLIC KEY BLOCK`. Cipher text say `PGP MESSAGE BLOCK`.

It shows you the interface so with someone else's key, now they're
there, you can encrypt emails to them however you'd like.

Now that we have someone's key we can compose a message.

### Insecure webmail clients

For the love of god, read the message in the notepad window above.
**Never compose sensitive text in an internet-enabled window!**. Use
notepad or the GPA "Clipboard" program.

Any draft/sent/received message that has been saved by a webmail
provider is forever outside of your control. Even if you "delete" it,
they still have access to it on their backend.

Please pause the screen and read this note. Webmail providers like Gmail
and some other clients will compromise your privacy. So this is what we
usually use. Something like notepad. Copying text. And then we open up
the Clipboard in GNU Privacy Agent. This is where you put your text. You
can also draft things in here, and you just click *Encrypt*.

You say which key you want to send it to. This is a test a test server.
You can find this key ID on a keyserver. It's emailed to that address.
To make sure that you've got your client configured properly we sign it
ourselves. It's not necessary but you can.

This will allow us to decrypt our own text. We're selecting both people
as recipients: Adele and ourselves. And this is saying "Just because
it's on a keyserver doesn't mean it's actually that person. Are you sure
that you know this key?".

Then you'll enter your passphrase. And with that your message will
become encrypted. So this is what it looks like. Again if anybody
intercepts this over the wire when it's an email, it's useless to them
without the recipient's private key. The public key is what you use for
encryption as a sender. The private key is needed as a recipient for
reading.

### How public key encryption works

Basically, this is the way GPG and public key encryption works:

Everyone has a keypair (2). Public and private.

The sender's (secret) **private** key is combined with the recipient's
(freely published)   **public** key(s) to create a math problem (the
ciphertext) that protects the plaintext.

This math problem (ciphertext) can only be solved by the recipient's
**private** (secret) key(s). The solution is plaintext.

So we copy that into the clipboard, assuming we actually sent this
across email and we are the recipient. You would then put in your
private passphrase. Once you've got that it's going to decrypt it. And
you see the plaintext is the same.

So they're freely convertible only **if** the message was encrypted to
your private key.

Public key encryption is pretty complex and we're covering very quickly
so we'll do a little more practice.

### Exchanging public keys with strangers

This is the robot we discussed earlier. We can use it to test your
settings. We're going to illustrate exchanging public keys with people
you're not familiar with. By doing this test their key if you didn't
already. You just copy it and paste it the [Key Manager].

The hundreds of blue links under Adele's key are the keys of people who
have signed *her key* (not a message). This is a method of saying that
keyholder X is certifying that keyholder Y is who they say they are.

This is us copying our public key to send to them. Just right click on
your own and click copy.

I'll paste it so you see what it looks like. That's what it is, it's a
block. You'd open up your email client, put in the recipient who is
associated with the key, sending them an email. Paste your key right in
there.

This isn't a security flaw. There's no benefits to the adversary by
doing this other than identifying yourself as the keyowner of that email
address if they're not the same.

When we send it this is what we received in return from Adele after we
did it. What she's done is she's taken that key and encrypted a message
*to us* which only we can read using our privtate key.

So you get that message, you open up the Clipboard. You paste that in
there and then you just click "Decrypt". As long as you've already put
your passphrase in, it won't ask you for it. [inaudible]

And this is the text. This is how Public Key Encryption works. And this
is how your source would be communicating with you.

We've highlighted a copy of of the public key included in the message,
but since we already found the key on a keyserver, we don't need to add
it again.

That's it for our crash test on use.

As far as publication, this is the [Electronic Frontier Fondation](http://eff.org).
Their staff directory. This is one of their legal directors. You see
they include their GPG keys in the content block. And in the link there,
when we go to this page, sure enough it's another key. All you have to
do is copy it. Anyone can do this. And then paste it with `Control` + `V`
into their window, and bam: one public key imported, right there. Cindy
Cohen, cindy@eff.org.

Now we can encrypt communications to her that cannot be eavesdropped
upon in transit. This is huge, and very important.

This is a really great way to piss of national security states and make
your air travel more interesting.

To close this out we'll practice encrypting one more time. To Cindy
using her key, using any message. On the Clipboard again, not in your
webmail. Then you click "Encrypt" with her name. Click "Yes", and she's
the only one who can decrypt this now.

That's it. Paste that, the cyphertext into your webmail, and you're good
to go.
