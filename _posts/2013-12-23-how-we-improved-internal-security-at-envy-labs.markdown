---
layout: post
title: "How we improved internal security at Envy Labs"
date: 2013-12-23 19:18
draft: true
---
For a while at Envy Labs, we stored the credentials for services that multiple people on the team needed to access inside of a [Backpack](http://37signals.com/backpack-retired) file.

Yes, you read that right.

A Backpack file whose sole method of authentication was an input field for a pre-authorized email address. I don't even know what kind of security the 37signals team used to store the text in Backpack files, but I'd rather not think about it.

It's very difficult to find an appropriate solution to share credentials on a team. You want to strike the right balance between security and usability, otherwise your security procedures will simply be evaded or ignored by your team.

When I first decided that it was time for us to tighten up the way we shared credentials inside of the Envy Labs team I looked around for well-designed and granular solutions that would allow me to:

1. store credentials in a secure (i.e. encrypted) way so that a security breach wouldn't risk exposing our passwords
2. make it easy for authorized members of the team to retrieve credentials when they need it without having to wait for a gatekeeper to grant them access
3. ensure that this solution made it easier to update or rotate passwords in case of a breach, or if someone who once had access later saw it revoked (yes, people quit and people get fired, you always should account for that)
4. even if people aren't given access to some credentials, ensure that it's easy for everyone to find out *whether* we have credentials for a service or not, in order to avoid duplicate accounts and confusion

The first solution I found was a service called [Passpack](https://www.passpack.com/). I wasn't impressed by its user-interface at first and that left me skeptical of whether it would be good enough to be adopted by the whole team. It's less about aesthetic design standards than usability. If the interface is tedious to use, it's no surprise people resent using your tool. Especially if they have to use it every single day.

Passpack seemed secure, because it's so rigid when it comes to security. But that rigidity tips the balance of usability far enough in the wrong direction that most people on the team resented using Passpack.

Our marketing team had started using LastPass and prefered it to Passpack so they actually copied the credentials they needed to use to LastPass, completely defeating the benefits of centralizing credentials — there was no way to know if a password has been updated on either side