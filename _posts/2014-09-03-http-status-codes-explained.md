---
layout: post
title: "HTTP Status Codes Explained"
date: 2014-09-03 13:42
location: "Val Morin, Québec, Canada"
categories: development
draft: true
---

I'm building an API for Code School right now. While it's private, I
don't think it's an excuse to not design it as if it were to be used
by thousands of different people using varied clients.

One thing I'm very concerned about is not leaking sensitive data from
the API. The importance of this has been shown once again recently with
the [brute force attacks on Apple's iCloud and FindMyiPhone APIs](https://www.nikcub.com/posts/notes-on-the-celebrity-data-theft/).

The mere fact that it was possible for attackers to check if someone's
email matched an existing iCloud account is a serious issue. Worse, I'd
wager thousands upon thousands of websites and web APIs would fare
equally if tested against this vulernability.

The problem is that API user experience is often at odds with security
best practices. It's very useful for an API client to know whether an
email matches an existing account because it allows the client to tell
the genuine owner of the email account that — for instance — they've
typed in an incorrect password for their account.

But of course, anyone who discovers a person's email address may attempt
to use the email to impersonate the owner inside a sign in form or an API
authentication endpoint. On the web, it's often validation feedback
within the interface that leaks the validitity of an email. Within an API,
it could be the response content (say if you return a list of errors).
But even more subtly, the HTTP status code your API sends back when
authentication can't proceed can be a tell-tale.

Say you try to authenticate by sending this request with no body:

```
POST /authenticate
```

You'll perhaps get back a `400 — Bad Request` status with no body.
According to the [W3C's HTTP 1.1 spec](http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html) this means:

> The request could not be understood by the server due to malformed syntax.
The client SHOULD NOT repeat the request without modifications.

So if you're a smart client (I mean that in the sense of a server & client
relationship), you know there's no point in trying again since the request
syntax is obviously wrong. You must be missing something.

Alright, so let's try again, this time with parameters in the body:

```
POST /authenticate
Body: email=email@example.com&password=blablablabla
```

You get a
