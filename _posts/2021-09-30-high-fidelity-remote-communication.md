---
layout: post
title: "High Fidelity Remote Communication"
date: 2021-09-30 20:16
update: 2021-10-28 14:16
location: "Montréal, Québec"
categories: development
summary: Remote is hard but it can work if you focus on what matters.
image: remote-720p-loop-preview.jpg
---

{% include video.html
name="remote-720p-loop.mp4"
poster="remote-720p-loop.jpg"
alt="Looping 720p video of my weird face pretending to react at things you say to me on a Zoom call." 
autoplay=true
loop=true
no_controls=true
muted=true
class="zoot"
%}

Before the pandemic even started, remote work was already on the rise
around the world because *it makes sense*. Knowledge work doesn’t need
to depend on crammed, loud, and unhealthy open offices located in
expensive areas devoid of affordable housing. Bringing a laptop to
a room inside of a building you spend hours to travel to every day is 
the definition of absurdity.

Instead working remotely has become almost normal, except to corporate
leaders who prefer portraying it as "working from home" as if you need
to be grateful for the (temporary) perk. This patronizing
butts-in-seats mentality assumes that you're not, you’re working *from
home*. Perhaps you're really doing laundry or running errands, but not
actually "working". This ignores the fact that work is already remote
by nature when it happens on the Internet. Large organizations 
*effectively* have remote offices. They coordinate work across cities 
and countries. Remote work is here, it's just not evenly distributed.

## Remote Shell Shock

One of the first complaints from first-time remote workers in the spring
of 2020 when the pandemic led to an abrupt exodus from shared offices
all over the world: it’s hard to communicate remotely. 

No shit.

It’s hard to communicate. Period. It was already hard for every remote 
worker who had to communicate with clustered workers crammed in loud 
conference rooms, often in blatant violation of fire codes. It’s only 
now more obvious to everyone how difficult it was for the remote workers 
to communicate before. 

{% include image.html
name="remote-code-school-standup.jpg"
alt="Picture of more than twenty people crowded together in the back of an office near an iMac sporting a tiny webcam in the foreground." 
caption="A whole-company standup meeting at Code School's office back in December 2013, featuring in the bottom right what would soon become my eyes and ears." 
%}

I was one of the first fully remote workers at my job back in 2013. One
month I was happily commuting at least three days a week to our Orlando
office, the next I was planning a move back to France. I set up shop as
an independent contractor in my 30 square meters (330 sq ft) studio in
Paris, six timezones away. My manager at the time was clear: be loud
about any friction you encounter, we want to make this work and you’re
going to be the canary in the coal mine. 

## Bad Meeting Habits

Quickly, I realized our stand-up meetings where quite awful remotely. A
dozen people standing in a circle in a large open space, talking in
turn about what they’re working on, doesn’t quite work. Especially with
distant webcam and a weak microphone. Soon, folks volunteered to pass a
laptop around so I could hear better. We worked on our own laptops all
day long but somehow crowded around one to give each other updates.
It's obvious in hindsight that too many people were involved, but it
was easy to overlook the issue in person. We soon reduced the size of
teams which needed to share frequent updates. I partially credit remote
communication for accelerating this realization. Standups later became
video calls were each person used their own machine, making everyone as
visible and audible, wherever they worked.  

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

## The Before Times

{% include image.html
name="remote-podcasting-setup.jpg"
alt="Profile picture of the author using Sony MDR 7506 monitor headphones and the Shure SM7B dynamic microphone." 
%}

By definition being *remote* means not being *there*. But *feeling
present* goes a long way. A simple look can trigger a strong reaction
and a sense of shared understanding. A slight change in intonation can
convey doubt or excitement better than a paragraph. Cameras can't
magically make your expressions visible when light isn't bouncing off
your face. Backlighting or [contre-jour][19] for example is a very
[common mistake][1] that I see very smart people make over and over
again, even during important video calls featuring very important people
you'd assume would have staff to assist them.

When I moved back to Paris in 2014, I purchased my first Logitech C920
720p webcam. Since I was also co-hosting a podcast at the time, I did
some microphone research and bought an absurdly expensive but oh so
great [Shure SM7B microphone][2], a [Scarlett 2i2][20] XLR to USB
interface (to convert the analog signal to USB) and a cheap
pre-amplifier. This setup alone allowed me to stand out and be often 
seen and heard better than many of my in-office co-workers who crowded 
together in conference rooms and open spaces.

## Sensors Aren't Eyes and Ears 

{% include image.html
name="remote-microphone-waveforms-compared.jpg"
alt="Comparing the audio waveforms of three different microphones: the 2019 16-inch MacBook Pro, the Logitech Brio webcam, and the Shure SM7B." 
caption="The flatter the audio output of a microphone, the less lifelike you will sound." 
%}

Still, being *so* remote was challenging. I didn’t know how to set up
the audio interface properly. I mistakenly held out on purchasing a
good set of studio headphones thinking I had a sense of my own voice’s
volume. But a microphone, like a camera, doesn’t have a human
perspective on what *loud* means. It will blast your co-worker’s ears
off or sound like you’re far away. If you're lucky someone will
complain that you're heard to understand. Most people won't
bother. Don't use a microphone with live feedback without
monitoring headphones. The pros do it for a reason. 

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

Here's a different a slightly longer demo of the RODE NT-USB microphone
where I tried to demonstrated the usefulness of an articulated boom arm: 

<figure class="audio">
    <figcaption>RODE NT-USB (10 cm from face)</figcaption>
    <audio
        controls
        src="{{ site.url }}/assets/rode-nt-usb.mp3">
    </audio>
</figure>

As a bonus, here's are some popular Apple mobile devices frequently used 
to send audio and video but don't fare particularly well even when 
recording directly on-device with the Voice Memos app:

<figure class="audio">
    <figcaption>Apple Airpod Max (on your face)</figcaption>
    <audio
        controls
        src="{{ site.url }}/assets/apple-airpod-max.mp3">
    </audio>
</figure>

<figure class="audio">
    <figcaption>Apple iPhone 12 Mini (close to your face)</figcaption>
    <audio
        controls
        src="{{ site.url }}/assets/apple-iphone-12-mini.mp3">
    </audio>
</figure>

<figure class="audio">
    <figcaption>Apple 2019 iPad Pro (30 cm from your face)</figcaption>
    <audio
        controls
        src="{{ site.url }}/assets/apple-2019-ipad-pro.mp3">
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

{% include image.html
name="remote-2015-logitech-c920.jpg"
alt="Screen capture of the output of a Logitech C920 webcam shot with ambient lighting behind my monitor." 
caption="Cropped Logitech C920 output lit with an Ikea lamp & soft white LED back in 2015." 
%}

I started out with a cheap and reliable webcam: the Logitech C920. It's
from 2012 and outputs only 720p but for nearly a decade this webcam was
basically the best out there. Especially given limitations in
bandwidth. Later on in the 2010s, webcams manufacturers introduced full
HD or 1080p resolution, and eventually 4K. It's still arguably too much 
for just showing a small face on a screen. As photo cameras became all 
about more megapixels, so did webcams. Focusing on raw output size over 
output quality, especially in low light. 

Compared to camera sensors now commpon in mobile phones, webcams are a
decade behind. My friend Justin Searls found [a way][22] to use an old
iPhone as a webcam and I completely get it. It’s far more practical
than the solution I arrived at just before the pandemic: using a Sony
A6000 mirrorless camera with an expensive 50mm lens and an Elgato Cam
Link 4K acquisition card so I can use a sensor and lens combo no webcam
maker can compete with. The strange video you see at the top of this
post was filmed with this setup. One that I actively recommended
against to any fellow remoter. Particularly folks who aren't into
photography or videography. It’s cumbersome, complex, and requires
constant fidgeting to keep the camera on, obtain a consistent color
temperature, or prevent automatic focus hunting due to shallow depth of
field. Plus you often have to replace the camera's battery with an
adapter so you don't run out of juice in the middle of a meeting. 

Two long years into this pandemic, one of the few companies that seems
to have grasped the importance of a quality sensor and lens combo is
Elgato, with their (thankfully mic-less) Facecam. But its output is too
wide by default and according to [Elgato's own GM it's best to tweak
exposure manually (at least for now)][21]. Logitech has been on top of
the webcam business for years, and their best offering is the Logitech
Brio. A decent camera sensor attached to a overly wide lens better
suited for YouTubers than remote workers whose face should be the sole
focus, not their fancy backdrops. You *can* force the 4K Logitech Brio
to crop most of the background it defaults to showing so you can
display what truly matters — your face — but it takes some futzing with
settings which should be unnecessary.

<iframe width="675" height="381" src="https://www.youtube-nocookie.com/embed/uzXcK0hHvUM?controls=1" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

If you watch the above demo I wonder if you'll wonder like me why 
multi-lens setups are so common in modern phones but don't exist in 
any webcam. The wide angle default is only appropriate to a minority of 
webcam users (streamers) while most people would benefit from a narrow 
35mm to 50mm lens equivalent that would focus on their face instead of 
their surroundings. 

Generally speaking, I think the Logitech Brio is the best solution for
most people given adequate lighting and restricting yourself to the
standard non-widescreen mode (I believe is the default but you can
adjust it with the [Camera Settings app][23] Logitech provides). 

{% include compare.html
first="remote-macbook-pro-2019-key-light.jpg"
second="remote-brio-key-light.jpg"
first_alt="2019 MacBook Pro webcam output"
second_alt="Logitech Brio webcam output" 
caption="2019 MacBook Pro vs. Logitech Brio w/ Elgato Key Light Air (click for full-res)" 
%}

Here's a list of gear I recently recommended as an alternative to my own
unwieldy custom setup. The minimum budget is more than double the
common "$300 remote stipend" reluctantly relinquished by most companies,
while they happily purchase snacks, ergonomic chairs, networking
equipment, as well as the typical utility and office leasing costs
required for in-office workers. This should give you pause. 

This kit is one of the simplest to use and most reliable you'll likely 
deal with. Yes, you can get find cheaper microphones and cameras if you 
sacrifice what I believe are essential features: 

- flicker-free consistent lighting (no headaches or artifacts) 
- croppable video output that focuses on your face, not the room
- narrow pickup microphones with live headphone monitoring
- headphones to hear yourself and avoid noise feedback loops

| Focus             | Brand         | Model               | Price   |
| ----------------- | ------------- | ------------------- | ------- |
| Lighting          | Elgato        | [Key Light Air][9]  | $180    |
| Face — Option 1   | Logitech      | [Brio][15]          | $200    |
| Face — Option 2   | Elgato        | [Facecam][16]       | $200    | 
| Voice — Option 1  | RODE          | [NT-USB][13]        | $170    | 
| Voice — Option 2  | AudioTechnica | [AT2005USB][14][^1] | $80     | 
| Mic Distance      | RODE          | [PSA1][5]           | $100    |      
| Ears              | Sony          | [MDR 7506][12]      | $100    |
| ----------------- | ------------- | ------------------  | -----   |
| **Minimum Total** |               |                     | **$660**|


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

{% include image.html
name="remote-desk.jpg"
alt="Photograph of my absurdly over-engineered remote worker desk." %}

I've had a much more [intricate setup][18] than the one I recommend
above since February 2020. I was preparing to author a video course for
Pluralsight and wanted to offer students the best possible learning
experience. In countless meetings since, often involving leaders far
above my paygrade, it's impossible to count the number of times someone
who matters noticed my facial expressions and asked me to share my
thoughts, or reached out to me in DMs afterwards to learn about my setup.

I'll leave you with this unfair example of a quick video demo of my 
custom setup which I shot a few months ago during a time of the day 
where the typical webcam is easily drowned out by backlighting 
especially without some bright and diffused lighting pointed at your 
face to compensate. I'm being caricaturally animated (although not that 
much for me) to highlight how much of my tone, facial expressions, and 
overal feelings you can perceive from this video. This is not edited in 
any way other than to make the file smaller and more compressed for 
easier playback on the web. Granted your Internet bandwidth is 
sufficient (and that's a big **if**) and your conferencing software of 
choice doesn't overly compress audio and video you'd likely experience
something similar on the other end. 

{% include video.html
name="remote-720p-demo.mp4"
poster="remote-720p-demo.jpg"
alt="Screen capture of the output of my custom Sony A6000 camera with a 50mm f/1.8 OSS lens attached and Elgato Key Light Air lighting." 
caption="Why can't most webcams convey your presence this well? Your phone does." 
%} 

An easily overlooked issue when discussing putting your face on camera
is that some folks may not be comfortable or even willing to be seen
inside their remote working location (home or otherwise). Especially in
larger meetings where they don't expect to intervene. I don't think
it's anyone's duty to always have a high quality camera always on. That
kind of visibility is clearly not comfortable for everyone but I think 
within reason — when not using chat or asynchronous messaging — it's 
extremely valuable for all parties.

It's the responsibility of employers to deploy the kind of budgets
already allocated toward in-office communication to remote work
equipment. It's also the role of folks like me (and you) to help
educate IT departments and business leaders on hardware solutions that
already exist today. 

It has become quite absurd to argue that remoteness has to mean becoming
a less visible and valued contributor to your organization. I hope this 
post can help you convince anyone who might still doubt that 
communicating remotely still has to be a pain.   

[^1]: Although cheaper, the Audio-Technica microphone doesn't come with 
a pop filter unlike the RODE NT-USB, but you can thankfully pick one of 
those up for fairly cheap and mount it on the microphone boom arm.
 
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
[19]: https://en.wikipedia.org/wiki/Contre-jour
[20]: https://focusrite.com/en/usb-audio-interface/scarlett/scarlett-2i2
[21]: https://mobile.twitter.com/JFest/status/1445382349257064448
[22]: https://reincubate.com/camo/
[23]: https://support.logi.com/hc/en-my/articles/360025132114-Camera-Settings