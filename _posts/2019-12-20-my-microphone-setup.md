---
layout: post
title: "My Microphone Setup"
date: 2019-12-20 13:18
location: "Orlando, Florida"
categories: development
draft: true
---

The microphone I use isn’t that great. It’s an old Samson CL8 cardioid
microphone from the era where we hosted podcasts weekly at Code School.
We also used it for voice over work on screencasts. Cardioid mics have a
very narrow pickup pattern (area where the microphone receives input) so
they’re great at isolating sound if you learn good mic technique. Like
most capsule microphone (there’s a membrane that receives vibrations
from your voice) they’re also tricky to use without causing too much
vibrations with plosives (P, T, F, D sounds).

And like most cardioid microphones (with some recent exception) this mic
isn’t USB but XLR and requires an interface. I use the simple and mostly
user friendly Scarlett 2i2 (2 inputs, 2 outputs) which is about as small
as these things get. It’s a USB device and most importantly it has a
pre-amp that allows you to increase the gain (sensitivity) of the mic
with hardware but also to receive live monitor feedback from the mic.
That’s a major benefit compared to most mics where you don’t have any
idea of how *you* sound.

It helps with mic technique, and it’s especially useful when recording
screencasts, participating in calls or podcasts, and surprisingly when
writing. You end up hearing your words as listeners would and it’s much
easier to write something that flows well.

I also use (and highly recommend) a desktop boom arm like the RODE PS1.
It allows your mic to float over your desk and follow your mouth without
requiring you to stand awkwardly near the mic (since cardioid mics
require you to be roughly a fist away from the capsule at all time). I
pair it with a Samson SP01 spider shock mount. Since the boom arm is
clamped onto my desk, any typing or palm resting I do while recording
would otherwise easily transfer as vibrations to the mic. Because the
Samson mic is fairly cheap it doesn’t include intricate internal shock
absorption like a lot of pro microphones. Some people use pop filters
(cloth mesh) to reduce plosive sounds since those literally hold back
some of your breath to prevent loud pops. I find them unwieldy and I
have good enough mic technique to avoid blowing air directly into the
microphone capsule, but that can take time to acquire.

Now that we’re at this wall of text, you can probably tell this is
hobby-level dedication to sound quality, like espresso nerdery. Like in
any domain, you can simplify by spending a lot more money. My other
setup requires no shock mount, or pop filter, but it does require
additional signal boosting (with a dedicated pre-amp):
https://www.shure.com/en-GB/products/microphones/sm7b

The Shure SM7B is often used in radios because it’s incredibly easy to
use for anyone. You can get insanely close and you won’t cause pops by
saying words with plosives or even blowing into the mic. It has an
internal shock mount so it doesn’t need any spidery-looking contraptions
to avoid picking up vibrations from your desk. I still use a Scarlett
2i2 to interface with my computer since it also uses an XLR cable
instead of USB, but I also need an additional amp since its base signal
is very quiet (it’s usually used with expensive audio capture equipment
which includes powerful signal processing). The easiest solution for
this is the Cloudlifter CL-1 (more on that here:
https://www.youtube.com/watch?v=rJCWEkoRLls) in front of the Scarlett
2i2. The RODE PS1 boom arm works just as well for that mic since the
thread on the back is compatible.

Biggest difference? Price:

| Microphone | Shockmount | Boom Arm | Pre-amp | USB Interface | Total |
| --- | --- | --- | --- | --- | --- |
| Samson CL8 ($90) | SP01 Samson Shockmount ($40) | RODE PS1 ($85) | Scarlett 2i2 USB XLR interface ($160) | $375 |
| Shure SM7B ($400) | None | RODE PS1 ($85) | Cloudlifter CL-1 ($150) | Scarlett 2i2 USB XLR interface ($160) | $635 |

You’ll also need quality closed cup headphones for both to avoid sound
leakage when you’re talking to someone (mic picking up on sound from
your headphones and feeding it back). I’ve had good luck with the cheap
Sony MDR7506 ($90) because they’re not music-focused so will give you a
more accurate representation of your microphone compared to heavy bass
music-focused headphones.

As you can tell by now this is a pandora’s box. There are cheaper setups
I recommend for distributed folks, authors, and podcasters. For instance
you’ll find $60 kits on Amazon with a cheap cardioid mic, shock mount,
pop filter, and arm. These all feel like great deals because they’re
all-in-one but you get what you pay for and not having live monitoring
or gain/volume control means you’re constantly fiddling with software
sound input controls and you have no idea what you sound like on a very
sensitive microphone. So be warned.
