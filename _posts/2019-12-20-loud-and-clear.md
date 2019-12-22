---
layout: post
title: "Loud & Clear"
date: 2019-12-20 13:18
location: "Orlando, Florida"
categories: development
image: microphone-setup.jpg
draft: true
---

It's kind of strange to me how many people who work or communicate in a
distributed fashion (remotely) treat the transmission of their voice as
an afterthought.

My audio recording setup is absurd for most people who would be much
better served by something as dead simple as AirPods or AirPods Pro.
AirPods have surprisingly good microphones on them (so do EarPods by the
way) and if that's the only thing you're going to carry with you, use
that.

There are however some noticeable drawbacks to AirPods:
- they're often very tied to the Apple ecosystem, if you don't like
  that, it's likely that you won't like them.
- they're tiny batteries, so while they'll easily last a couple of hours
  when listening and talking, you do have to be mindful of their
  batteries, which can't be replaced when they get old.
- you can't hear your own voice and therefore it's tricky to know
  whether your ambiant sound is too loud, and whether you're speaking at
  the appropriate volume, that said ambiant microphone isolation is very
  good.

Just like large sensors tend to produce much better image quality on
cameras, so do large sensors (capsules) produce better audio quality on
microphones. Condenser microphones don't have to be incredibly expensive
and they will dramatically improve the impact of your voice when it's
sent across a wire to another person. Your voice will be clearer, more
life-like (assuming no heavy in-transit audio compression), and the
modulations of your speech will allow you to stand out when you speak,
especially compared to speakers who are communicating through a tin can.
Just like a good headshot can go a long way to making you look
presentable, so can a good microphone make you sound more put together.

![Close up shot of a sideways Samson CL8 cardioid microphone attached to
a boom arm with a shockmount and a pop filter attached][image]

The microphone I use most of the time isn’t *that* great. It’s an old
[Samson CL8][cl8] [cardioid microphone][cardioid] from the era where we
hosted podcasts weekly at Code School. We also used it for voice-over
work on screencasts. Cardioid mics have a very narrow pickup pattern
(area where the microphone receives input) so they’re great at isolating
sound if you learn good mic technique. Like most capsule microphone
(there’s a membrane that receives vibrations from your voice) they’re
also tricky to use without causing too much vibrations with
[plosives][plosives] (P, T, F, D sounds).

And like most cardioid microphones (with some recent exception) this mic
isn’t USB but XLR and requires an interface. I use the simple and mostly
user friendly [Scarlett 2i2][2i2] (2 inputs, 2 outputs) which is about
as small as these things get. It’s a USB device and most importantly it
has a pre-amp that allows you to increase the gain (sensitivity) of the
mic with hardware but also to receive live monitor feedback from the
mic. That’s a major benefit compared to most mics where you don’t have
any idea of how *you* sound.

It helps with mic technique, and it’s especially useful when recording
screencasts, participating in calls or podcasts, and surprisingly when
writing. You end up hearing your words as listeners would and it’s much
easier to write something that flows well.

I also use (and highly recommend) a desktop boom arm like the [RODE
PSA1][psa1]. It allows your mic to float over your desk and follow your
mouth without requiring you to stand awkwardly near the mic (since
cardioid mics require you to be roughly a fist away from the capsule at
all time). I pair it with a Samson SP01 spider shock mount. Since the
boom arm is clamped onto my desk, any typing or palm resting I do while
recording would otherwise easily transfer as vibrations to the mic.
Because the Samson mic is fairly cheap it doesn’t include intricate
internal shock absorption like a lot of pro microphones. Some people use
pop filters (cloth mesh) to reduce plosive sounds since those literally
hold back some of your breath to prevent loud pops. I find them unwieldy
and I have good enough mic technique to avoid blowing air directly into
the microphone capsule, but that can take time to acquire.

Now that we’re at this wall of text, you can probably tell this is
hobby-level dedication to sound quality, like espresso nerdery. Like in
any domain, you can simplify by spending a lot more money. My other
setup requires no shock mount, or pop filter, but it does require
additional signal boosting (with a dedicated pre-amp).

The [Shure SM7B][sm7b] is often used in radios because it’s incredibly
easy to use for anyone. You can get insanely close and you won’t cause
pops by saying words with plosives or even blowing into the mic. It has
an internal shock mount so it doesn’t need any spidery-looking
contraptions to avoid picking up vibrations from your desk. I still use
a Scarlett 2i2 to interface with my computer since it also uses an XLR
cable instead of USB, but I also need an additional amp since its base
signal is very quiet (it’s usually used with expensive audio capture
equipment which includes powerful signal processing). The easiest
solution for this is the Cloudlifter CL-1 in front of the Scarlett 2i2.
The RODE PSA1 boom arm works just as well for that mic since the thread
on the back is compatible.

Biggest difference? Price. The SM7B is $400 where the CL8 is $90. And it needs
a dedicated pre-amp like the Cloudlifter CL-1 ($160).

| Microphone | Shockmount | Boom | Pre-amp | Interface | Total |
| --- | --- | --- | --- | --- | --- |
| [Samson CL8][cl8] | [SP01][sp01] | [PSA1][psa1] | None | [Scarlett 2i2][2i2] | ~$400 |
| [Shure SM7B][sm7b] | None | [PSA1][psa1] | [CL-1][cl1] | [Scarlett 2i2][2i2] | ~$650 |

You’ll also need quality closed cup headphones for both to avoid sound
leakage when you’re talking to someone (mic picking up on sound from
your headphones and feeding it back). I’ve had good luck with the cheap
Sony MDR7506 (~ $100) because they’re not music-focused so will give you a
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

[image]: {{ site.url }}/assets/microphone-setup.jpg
[2i2]: https://focusrite.com/en/usb-audio-interface/scarlett/scarlett-2i2
[cl1]: https://www.cloudmicrophones.com/cloudlifter-cl-1
[cl8]: http://www.samsontech.com/samson/products/microphones/condenser-microphones/cl8/
[psa1]: http://www.rode.com/accessories/psa1
[sm7b]: https://www.shure.com/en-GB/products/microphones/sm7b
[sp01]: http://www.samsontech.com/samson/products/accessories/microphone-accessories/sp01/
[plosives]: https://en.wikipedia.org/wiki/Stop_consonant
[cardioid]: https://en.wikipedia.org/wiki/Microphone#Cardioid,_hypercardioid,_supercardioid,_subcardioid
