---
layout: post
title: "High Fidelity Remote Communication"
date: 2021-09-30 20:16
location: "Montréal, Québec, Canada"
categories: development
summary: Remote work requires high fidelity communication and it's still not easy to achieve.
draft: true
image: remote-desk.jpg
---

{% include image.html
name="remote-desk.jpg"
alt="Photograph of my absurdly over-engineered remote worker desk." %}

This pandemic isn’t over. Before it even started, remote work was on the 
rise around the world. Why? Because it makes sense. Knowledge work 
doesn’t need to depend on crammed, loud, distracting, unhealthy open 
offices located in overly expensive areas. It also makes little sense 
for knowledge workers who work on laptop to bring that laptop to a room 
inside of a building they have to travel hours to and from every single 
day.

Instead, more people and their bosses choose to work remotely. I avoid
the tern “Work From Home”. It's infused with a particular
butts-in-seats condescension perfected by corporate leaders. You’re not
working, you’re working *from home*. Be grateful. We *let* you do that.
Maybe you're doing laundry, running errands, but not really "working".
It pretends that work isn't already remote by nature when it happens on
the Internet. Large companies *effectively* have remote offices, 
coordinating work across cities and countries. Remote work is here,
it's just not evenly distributed.

The first thing inexperienced remote workers complained about when the 
pandemic led to a sudden exodus from shared offices spaces all over the 
world in the spring of 2020: it’s hard to communicate remotely. 

No shit.

It’s hard to communicate. Period. It was already hard for every remote 
worker who had to communicate with clustered workers crammed in loud 
conference rooms, often in blatant violation of fire codes. It’s only 
now more obvious to everyone how difficult it was for the remote workers 
to communicate before. 

## Remote Shell Shock

{% include image.html
name="remote-code-school-standup.jpg"
alt="Picture of more than twenty people crowded together in the back of an office near an iMac sporting a tiny webcam in the foreground." 
caption="A whole-company standup meeting at Code School's office back in December 2013, featuring in the foreground what would soon become my unfortunate eyes and ears." 
%}

I was one of the first fully remote worker at my job back in 2013. It
happened very suddenly. One month I was happily driving 3 days a week
to our Orlando office, the next I plan a move back home to France, and
set up shop as an independent contractor at my old 30 square meters
studio in Paris. I became the only full-time remote collaborator. Six
timezones away. Thomas Meeks, my manager at the time, told me: be loud
about any friction you encounter, we want to make this work and you’re
going to be the canary in the coal mine. 

## Inadequate Meeting Habits

So I was. I quickly realized that our stand-up meetings where awful 
remotely. A dozen people standing in a circle in a large echoing open 
space, talking in turn about what they’re working on. That doesn’t quite 
work with a distant iMac camera and a single underpowered 
omnidirectional microphone. Folks eventually volunteered to pass a 
laptop around so I could hear them give their update, or at least point 
the camera in the general direction of the speaker. This was 2014. Yes, 
it was absurd. These intelligent people were working on discrete laptops 
all day but somehow crowded around a single one to give each other 
updates. The obvious-in-hindsight realization was that our team standup 
included way too many people. It was easy to dismiss this problem in 
person. Eventually, we reduced the size of standups to people who 
absolutely needed to hear updates from each other, and after what feels 
like far too many years those standups became video calls were each 
person connected on their own machine so they could be heard and seen 
whether they were in-office or remote.  

## Communication Bandwidth Modulation

It’s hard to say that I thrived working 7253 kilometers away from my 
co-workers, but somehow, I managed. I enacted a personal policy that has 
persisted ever since, sometimes I surmise to the annoyance of my more 
microphone or camera shy co-workers: any non-binary (yes or no) answer 
should lead to an audio or video call so that context can be provided 
much faster than through back and forth text-based chat. Any 
demonstration should be done over screensharing or recorded (and edited) 
screencast, not with lazily put together step-by-step instructions. 
That's because there are always missing steps, and you never identify 
them when you’re writing them down. You waste other people's time 
instead.

## Remote Presence Circa 2014

{% include image.html
name="remote-podcasting-setup.jpg"
alt="Profile picture of the author using Sony MDR 7506 monitor headphones and the Shure SM7B dynamic microphone." 
caption="Sure it looks and sounds great, but this gear is far to complex and expensive for most." 
%}

By definition being *remote* means not being *there*. But *feeling
present* goes a long way. A simple look can trigger a strong reaction
and a sense of shared understanding. A slight change in intonation can
convey doubt or excitement better than a paragraph. Cameras can't 
magically make your expressions visible when light isn't bouncing off 
your face. Backlighting is a very [common mistake][1]. 

Back in Paris, I purchased my first Logitech C920 720p webcam. Since I
was co-hosting a podcast at the time, I'd done some research on
microphones and bought — at my own expense — an absurdly expensive
[Shure SM7B microphone][2], a Scarlett 2i2 XLR to USB interface
(to convert the analog signal to USB) and a cheap pre-amplifier.

## Sensors Aren't Eyes and Ears 

{% include image.html
name="remote-microphone-waveforms-compared.jpg"
alt="Comparing the audio waveforms of three different microphones: the 2019 16-inch MacBook Pro, the Logitech Brio webcam, and the Shure SM7B." 
caption="The flatter the audio output of a microphone, the more compressed and less lifelike you will sound." 
%}

It was... challenging. Although it was a fairly simplified one, I didn’t
know how to set up the audio interface. I mistakenly held out on
purchasing a good set of studio headphones thinking I had a sense of my
own voice’s volume. But a microphone, like a camera, doesn’t have a
human perspective on what *loud* means. It will blast your co-worker’s
ears off or sound like you’re far away. If you're lucky someone will
complain that you're heard to understand. Most won't people won't
bother. Don't ever bother using a microphone with live feedback without 
monitoring headphones. Professionals always do it for a reason. 

Your typical headphone microphones don’t count. You'll only hear other
people's voices when you wear them, not your own. This is even worse 
with noise cancellation, which gives you less awareness of your own 
voice's volume. Even if *your* voice is a the appropriate level in your 
environment, you'd be surprised how differently you sound depending on 
what microphone you're using and how far away it is from your face.

Here are three radically different microphones recording the exact same
input albeit at different distances from my voice:

<figure class="audio">
    <figcaption>2019 16-inch MacBook Pro (60 cm from face)</figcaption>
    <audio
        controls
        src="{{ site.url }}/assets/2019-16-inch-macbook-pro.mp3">
    </audio>
</figure>

<figure class="audio">
    <figcaption>Logitech Brio webcam (50 cm from face)</figcaption>
    <audio
        controls
        src="{{ site.url }}/assets/logitech-brio.mp3">
    </audio>
</figure>

<figure class="audio">
    <figcaption>Shure SM7B (10 cm from face)</figcaption>
    <audio
        controls
        src="{{ site.url }}/assets/shure-sm7b.mp3">
    </audio>
</figure>

I think these demonstrate how much more **present** you can sound with 
a better microphone. I talk in a bit more detail about this and 
microphone technique [in a previous post][17].

## Face Time

{% include image.html
name="remote-code-school-platform-standup.jpg"
alt="Screenshot of a fully-remote standup with three people each on their own webcams." 
caption="A Code School Platform team standup from December 2017, finally fully remote." 
%}

Now let’s talk about your face. Apple did something quite meaningful 
with FaceTime. They put the onus on precisely what makes you miss your 
family and friends: their face. Not where they happen to be at the time 
you call them, or the broad context of what’s around them in a 
horizontal view, but their vertical portrait. Somehow, Apple still 
manages to produce webcams that are as bad as they were a decade ago. 
Meanwhile, Apple makes some of the best selfie phone cameras in the 
world. 

I started out with a relatively cheap webcam: the Logitech C920. It's a 
workhorse. It was released in 2012 and its resolution is only 720p. Yet 
for nearly a decade this webcam made sense considering how little 
bandwidth you could dedicate to display a face on the Internet. In the 
late 2010s, more webcams manufacturers introduced full HD or 1080p 
resolution, and later 4K (1920 by 2180 pixels). It was and still is a 
fairly unnecessary output for a face on a screen. But just as 
photography cameras were taken over by the megapixel wars so too did the 
webcam industry only focus on raw output size, rather than output 
quality, especially in low light. 

Compared to the camera sensors that are now commpon on mobile phones, 
webcams are terrible. My friend Justin Searls found a way to use his 
iPhone as a webcam. This seems obvious. It’s far more practical than the 
solution I arrived at before the pandemic: using a Sony A6000 mirrorless 
camera with an expensive 50mm lens and an Elgato Cam Link 4K acquisition 
card so I can use a sensor and lens combo no webcam maker can compete 
with. 

This setup is never the one I recommend to fellow remoters, especially 
folks that aren’t deeply familiar with photography of videography. It’s 
cumbersome, complex, and requires constant fidgeting. Keeping the camera 
on, making sure the color temperature is fixed, the aperture wide enough 
to prevent frequent automatic focus hunting, and the battery replaced 
with a dummy powe adapter to prevent runtime issues. 

Two long years into this pandemic, the only company that seems to have 
grasped the importance of a quality sensor and lens combo is Elgato, 
with their Facecam. Logitech has been on top of the webcam business for 
years, and their best offering is the Logitech Brio. A excellent camera 
sensor on a far too wide camera that befits YouTubers with carefully 
crafted backdrops far more than remote workers whose face should be the 
sole focus, not their environment. You *can* force the 4K Logitech Brio 
to crop most of the background it defaults to showing so you can display 
what truly matters — your face — but it takes some futzing with settings 
which should be unnecessary.

To wrap up this piece, which I originally intended to be more 
actionable, allow me to give you a list of gear I recently recommended 
as an alternative to my unwieldy custom setup[^2] and which requires 
a budget of roughly $600. Yes, that's a *lot* of money. It's roughly 
double the typical "remote stipend" reluctantly relinquished by 
companies to remote workers, while they happily purchase snacks, 
ergonomic office chairs, networking equipment, and so much more. 

This kit is one of the simplest to use and most reliable you'll likely 
deal with. Yes, you can get find cheaper microphones and cameras if you 
sacrifice what I believe are essential features: 

- flicker-free consistent lighting (no headaches or artifacts) 
- narrow field of view lenses trained on your face, not the room
- narrow pickup microphones with live headphone monitoring
- headphones to hear yourself and avoid noise feedback loops

| Focus            | Brand         | Model             | Price |
| ---------------- | ------------- | ----------------- | ----- |
| Lighting         | Elgato        | [Key Light Air][9] | $180  |
| Face — Option 1  | Elgato        | [Facecam][16]     | $200  | 
| Face — Option 2  | Logitech      | [Brio][15]        | $200  |
| Voice — Option 2 | AudioTechnica | [AT2005USB][14]   | $80   | 
| Voice — Option 1 | RODE          | [NT-USB][13]      | $170  | 
| Ears             | Sony          | [MDR 7506][12]    | $100  |      

This list is by no means exhaustive, and yes it's very different than 
what I've recommended [in the past][1] because the world of remote gear 
is evolving at last. I'd warn you against integrated 
solutions (all-in-one lighting, camera, microphone) but it's possible a 
company like Elgato will come out a solution that does it all pretty 
well in the future. 

The one-stop-shop doesn't exist quite yet, but I can tell you from 
experience that you can already communicate remotely with higher 
fidelity than the majority of office workers through the world did even
before the pandemic. While your three-dimensional presence will never 
be replaceable, it's possible for two-way communication to have an 
unprecendented amount of subtlety.

## Remote Presence 

I've had a much more [intricate setup][18] than the one I recommend
above since February 2020. I was preparing to author a video course for
Pluralsight and wanted to offer students the best possible learning
experience. In countless meetings since, often involving leaders far
above my paygrade, it's impossible to count the number of times someone
who matters noticed my facial expressions and asked me to share my
thoughts, or reached out to me in DMs afterwards to learn about my setup.

That kind of visibility is clearly not comfortable for everyone, but 
I think it's hard to argue that remoteness means you will become an 
invisible[^1] employee anymore. 

[^1]: That does require turning on your camera, even in meetings where you don't  expect to say anything. I know there's a big debate about this that is far more complex than the issue of visibility. I don't mean to diminish this. None of this post is meant to argue that it's the personal responsibility of everyone to always have high quality cameras turned on when communicating remotely, far from it. I believe it's the responsibility of employers to deploy the same kind of budgets they deploy to offer basic communication capabilities via in-office IT, and the role of folks like me to advocate to these IT professionals and their leaders, as I have at Pluralsight. 
 
[1]: /posts/in-sight/#point-the-light-toward-you
[2]: /posts/loud-and-clear/#dynamic-cardioid-microphones
[3]: https://www.cloudmicrophones.com/cloudlifter-cl-1
[4]: https://motu.com/en-us/products/m-series/m2/
[5]: https://www.rode.com/accessories/stands/psa1
[6]: https://electronics.sony.com/imaging/lenses/aps-c-e-mount/p/sel50f18
[7]: https://www.elgato.com/en/cam-link-4k
[8]: https://electronics.sony.com/imaging/interchangeable-lens-cameras/aps-c/p/ilce6000l-b
[9]: https://www.elgato.com/en/key-light-air
[10]: https://www.shure.com/en-US/products/microphones/sm7b
[11]: https://www.youtube.com/watch?v=vTbxW12-QMc
[12]: https://pro.sony/ue_US/products/headphones/mdr-7506
[13]: https://www.rode.com/microphones/nt-usb
[14]: https://www.logitech.com/en-us/products/webcams/brio-4k-hdr-webcam.html
[15]: https://www.audio-technica.com/en-us/at2005usb
[16]: https://www.elgato.com/en/facecam
[17]: /posts/loud-and-clear/#microphone-technique
[18]: /setup