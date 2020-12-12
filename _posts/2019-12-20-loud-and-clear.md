---
layout: post
title: "Loud &amp; Clear"
date: 2019-12-20 13:18
update: 2020-01-30 00:08
location: "Orlando, Florida"
categories: development
image: microphone-setup.jpg
---

It's strange how many people who work or communicate in a distributed
fashion treat the transmission of their voice as an
afterthought.

My audio setup is a bit excessive for most people. You would probably
be better served by something as pricey-yet-simple like AirPods. Despite
their size, they carry a surprisingly decent microphone, as do EarPods.
And unlike a serious microphone setup, you're much more likely to carry
them with you when you travel.

There are, however, some noticeable drawbacks to AirPods:
- they're tied to the Apple ecosystem.
- you have to be mindful of [their battery][airpod-charge] level.
- they do a lot of heavy-handed audio compression
- you can't hear your own voice, this is worse than it... sounds.

Large image sensors tend to produce drastically better image quality
on digital cameras. Large microphone sensors (capsules) similarly
produce noticeably better audio quality. These microphones don't
*have to be* incredibly expensive and they will dramatically improve the
impact of your voice when it's sent across a wire to another person.

Your voice will be clearer, more life-like, and the modulations of your
speech will allow you to stand out when you speak. Especially compared
to speakers who are communicating through a tin can of a microphone. You
already know the value of a good headshot, or maybe you're aware of the
importance of good lighting with webcams, but microphones are recording
the actual message, not just the medium. They matter a lot.

## Condenser Cardioid Microphones

![Close up shot of a sideways Samson CL8 cardioid microphone attached to
a boom arm with a shockmount and a pop filter attached][image]

The microphone I use most of the time isn’t *that* impressive. It can be
found new for as low as $70, and even less used. But don't get fooled,
you can't use it without some accessories I'll go into later.

It’s an old [Samson CL8][cl8] [cardioid microphone][cardioid] from the
now bygone era when we hosted podcasts weekly at Envy Labs and Code
School. It's a workhorse and it's been working without a glitch for at
least a decade. We routinely used it for voice-over work on screencasts.

Cardioid microphones like the CL8 have a very narrow pickup pattern: the
area where the microphone actually receives audio input. That makes them
great at isolating sound, especially if you learn decent microphone
technique. The capsule inside of the microphone receives vibrations from
your mouth hole and converts them into an analog signal. Because of the
fairly sensitive capsule, the CL8 is quite sensitive to [plosives][plosives]
(P, T, F, D sounds) but it's nothing some care or a good pop filter can't prevent.

## XLR to USB Audio Interface

As an analog output microphone, the CL8 ends in a male XLR connector
which means it requires an XLR to USB audio interface to convert the
signal into a digital one. I use the simple and mostly user-friendly
[Scarlett 2i2][2i2] (2 inputs, 2 outputs) which is about as small as
these things get. The 2i2 includes a decent [preamplifier][preamp]
("preamp") that allows you to increase the gain (sensitivity) of the mic
with hardware but also to receive live monitor feedback from the mic.

When I said you can't hear yourself when speaking into AirPods, this is
what I meant. With live monitoring, you hear how you actually sound to
your audience. This feedback look is immensely valuable to improve your
microphone technique. It’s especially useful when recording screencasts,
participating in calls or podcasts, and surprisingly when writing. You
end up hearing your words as listeners would and it’s much easier to
write something that flows well. I use it constantly to edit my own
writings.

## Desktop-mounted articulated boom arm

I highly recommend a desktop boom arm like the [RODE PSA1][psa1]. It
lets your microphone float over your desk and follow your mouth without
requiring you to stand awkwardly near the mic. Mine is paired with a
Samson SP01 spider shock mount. Since the boom arm is clamped onto my
desk, any typing or involuntary finger drumming I do while recording
would otherwise easily transfer as vibrations to the mic. Some folks use
pop filters to reduce plosive sounds since those can hold back some of
your breath to prevent loud popping sounds. I find them unwieldy and
I've managed to become good enough at avoid blowing air directly into
the microphone capsule so I've stopped using them, but you might find
them useful at least at first considering how cheap they are.

You can probably tell at this point that this all requires a serious
*level* of dedication to sound quality, similar to espresso nerdery. As
with any domain, you can always simplify the setup by spending a lot
more money. You can also easily spend yourself into diminishing
audiophile returns. My alternative microphone setup requires no shock
mount, or pop filter, but it does require additional signal boosting.

## Dynamic Cardioid Microphones

The [Shure SM7B][sm7b] is often used in radios because it’s incredibly
easy to use. You can get insanely close and you won’t cause
pops by saying words with plosives or even blowing into the mic. That's
because, as a dynamic microphone, it's designed to record loud sounds
like instruments or singers. Instead of a capsule, it uses a wire coil
inside of its elogated body and you talk into the end of it rather than
a side as you would with condenser microphones like the CL8. This means
the microphone technique is similar to what you'd do with a handheld
singing microphone like the kinds you've probably used at karaoke.

The SM7B comes with an internal shock mount so it doesn’t need any
spidery-looking contraptions to avoid picking up vibrations from your
desk. I still use a Scarlett 2i2 to interface with my computer since it
also uses an XLR cable instead of USB, but I also need an additional amp
since its base signal is very quiet (it’s usually used with expensive
audio capture equipment which includes powerful signal processing). The
easiest solution for this is the [Cloudlifter CL-1][cl1] in front of the
Scarlett 2i2. The RODE PSA1 boom arm works just as well for that mic
since the thread on the back is compatible.

Biggest difference? Price. The SM7B is $400 where the CL8 is $90. And it
needs a dedicated pre-amp like the Cloudlifter CL-1 ($160). It adds up
quick.

## Wireless vs. Condenser vs. Dynamic Microphones

| Model | Shock | Boom | Pre | USB | Total |
| --- | --- | --- | --- | --- | --- |
| [AirPods][airpods] | None | None | None | None | $160 |
| [Samson CL8][cl8] | [SP01][sp01] | [PSA1][psa1] | None | [2i2][2i2] | $400 |
| [Shure SM7B][sm7b] | None | [PSA1][psa1] | [CL-1][cl1] | [2i2][2i2] | $650 |

You can always find cheaper setups, and I've recommendded some in the
past for distributed co-workers and acquaintances. For instance you’ll
find $60 kits on Amazon with a cheap cardioid mic, shock mount, pop
filter, and arm. These will feel like great deals because they’re
all-in-one. But you'll quickly realize those often don't have live
monitoring or any hardware gain/volume control. This means you'll end up
spending a lot of time fiddling with software sound input controls
(worse, at the OS level) and you'll likely struggle to get a sense for
what you sound like. So be warned.

## Microphone Technique

No matter how much money you spend, if you don't *spend* more time
learning *how* to use the tool, you'll be pissing money down the drain.

A $3000 double boiler espresso machine is a marvel of engineering but in
the hands of someone who isn't interested in learning the ins and outs
of coffee making, it's just a hulking heap of metal that draws 1000
watts of power and constant comparisons to the wasteful ease of a K-cup
trash printer.

I first got interested in microphones in 2010 when I bought my first
Yeti from Blue Microphones (skip it). Ten years later and I'd say
I'm competent with most of the variables of voice recording:
- Appropriate distance from the noise hole.
- Angled away from the line-of-breath.
- Grounded power delivered by a [sine wave UPS][ups].
- Avoid electromagnetic interference with quality cables.
- Decibels should stay below 0 even when you raise your voice.
- Loudness is relative, trust the tools not your ears.
- Remember to breathe, slow down.

The capsule inside of your microphone is like a partner's very sensitive
eardrum when your mouth is centimeters away from it. Stop. Yelling.

Listen to some of the greatest podcasts out there: Radiolab, Serial, 99%
Invisible, Criminal. One thing you'll realize quickly is how airy the
voices of their hosts are. Jad Abumrad and Sarah Koenig in particular
actually sound *earnest*. It might sound absurd, but just as you can
hear someone smile, so can you sound honest and authoritative if you do
the right thing.

![Schematic showing the cardioid polar pattern of a microphone and how the sweet spot for placing one's mouth is roughly a fist away from the front of the microphone and roughly 30 degrees around the center][mic-technique]

The sweet spot will vary depending on the timber of your voice but my
rule of thumb for most people is "a fist away" because it's easy to
measure. The size of your fist doesn't matter than much.

An easy trap to fall into when you get into serious voice recording
gear is accoustic room treatments such as foam, bass traps, and even
recording booth kits. The whole point of cardioid polar pattern
microphones is that they already ignore much of a room's reflective
noise. Unless you record in the largest and most reflective (tile, glass,
hard and wide surfaces) room, you probably shouldn't worry about
accoustics until you have an unmistakable sound reflection/echo problem.

Finally, remember that your body will affect the way you sound. Try
placing your microphone higher than your head on the boom arm so you
don't slouch to speak into it. Keep water nearby so you don't sound
parched and raspy. There's nothing worse than the high fidelity sound of
someone sticky jowls. Nasal congestion will ruin your diction. Learn to
decompress your sinuses or keep some safe nasal decongestant around. And
if you find yourself slurring, stretch out your mouth muscles a bit with
some diction excercises ("Unique, New York") to relax these muscles and
help you articulate.

I'm sure it sounds like a lot in the aggregate, but these are not things
you have to do all at once. Microphone technique can help someone using
corded EarPods and other crappy wire-mounted microphones. You can start
small. But if you do anything about the way you sound, make it recording
yourself and listening back to how you sound to people who aren't in the
room with you. It will give you a great idea of how much room for
improvement you have.

**Note: you can go a long way with great sound, but sometimes watching
someone's facial expression when they speak -- and when they don't -- can
make all the difference in the world. I wrote a follow up to this post on
the topic of [webcams and how to make them suck less][in-sight].**

[image]: {{ site.url }}/assets/microphone-setup.jpg
[mic-technique]: {{ site.url }}/assets/microphone-sweet-spot.jpg
[2i2]: https://focusrite.com/en/usb-audio-interface/scarlett/scarlett-2i2
[cl1]: https://www.cloudmicrophones.com/cloudlifter-cl-1
[cl8]: http://www.samsontech.com/samson/products/microphones/condenser-microphones/cl8/
[psa1]: http://www.rode.com/accessories/psa1
[sm7b]: https://www.shure.com/en-GB/products/microphones/sm7b
[sp01]: http://www.samsontech.com/samson/products/accessories/microphone-accessories/sp01/
[plosives]: https://en.wikipedia.org/wiki/Stop_consonant
[cardioid]: https://en.wikipedia.org/wiki/Microphone#Cardioid,_hypercardioid,_supercardioid,_subcardioid
[airpods]: https://www.apple.com/airpods/
[airpod-charge]: https://support.apple.com/en-us/HT207012
[preamp]: https://en.wikipedia.org/wiki/Preamplifier
[ups]: https://superuser.com/questions/912679/when-do-i-need-a-pure-sine-wave-ups
[in-sight]: /posts/in-sight
