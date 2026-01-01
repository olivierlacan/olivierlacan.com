---
layout: post
title: Seek to Discover
draft: true
date: 2025-02-15 01:49
location: "Seattle, Washington"
categories: 
 - life
 - nature
summary: Machines can help us learn about the world, when we use them right.
---

On February 4th, 2015 the folks behind iNaturalist — one of the largest open source
projects to explore and document the natural world — released a new version
of their excellent (and *free*) [Seek iOS and Android app][1].

This release (2.17.0) includes the first major update to their real-time computer
vision model in several years according to the release notes. 

> This update marks the first enhancement to the computer vision model since Seek’s inception. With this improvement, the app can now identify approximately 80,000 species, a significant increase from the previous 20,000. We hope this update enhances your experience and brings you greater satisfaction when using the app.

The [iNaturalist team wrote about this model when Seek 2.0 was released in 2019][2].

Seek is a great little app because of its simplicity and lack of 
authentication requirement. This makes it particularly great for kids, 
older folks, or people who aren't comfortable with technology.

You can launch the app, point it at flora or fauna, and it will routinely 
identify the specific plant or animal you point it at. 

Seek optionally allows you to sign into an iNaturalist account so you 
can send your observations to the community for review. These observation
can be used for biodiversity research, and provide excellent data you can
directly access to see seasonal populations of specific plant species 
for example. 

One aspect of Seek I appreciate is that it will label `Introduced` and 
`Native` species. While not foolproof (identificatins *can* be wrong) it's 
a valuable tool to raise awareness about potentially invasive species 
compared to native and potentially threatened ones.  

Seek also turns the fun but not so educational Pokemon GO pattern into 
a vector for natural world discovery. Discovering new species is 
celebrated, since the app remembers your past observations. It also 
uses simple badge reward system to encourage you to discover more species 
of different kids: plants, birds, fungi, arachnids, mammals, amphibians, 
mollusks, reptiles, fish, etc. Each month also brings challenges to 
encourage folks to observe specific groups or specific areas where 
you might encounter them in a given season.

While you can tell from the lack of authentication requirement that 
Seek is privacy and kid-friendly by default, it's maintained by an 
[independent 503c nonprofit organization][7]. The California Academy of 
Sciences and Natural Geographic provided support between 2014 and 2023. 

At its inception, iNatural was a final project for group of Master's 
students at the UC Berkeley School of Information, some of whom are 
still involved in the project. A bit of a far cry from some of the 
commercial alternatives that have cropped up over the past few years as 
computer vision and machine learning made this technology more accessible. 

Speaking of technology, while I could deal with less React in my life, 
the [Seek app itself][3] is pragmatically built with ReactNative. 
iNaturalist on the other hand is a large [Rails app][4]) which also 
has a NodeJS [API][5], all of which are long-running open source projects.

I took a swing at fixing some minor state issues with the camera roll 
logic not too long ago and while it was tricky to locally set up the 
iOS app at the time, I eventually succeeded. The team also made local 
development setup easier recently, notably by 
[simplifying the installation of models][6].


[1]: https://www.inaturalist.org/pages/seek_app
[2]: https://www.inaturalist.org/blog/23075-real-time-computer-vision-predictions-in-seek-by-inaturalist-version-2-0 
[3]: https://github.com/inaturalist/SeekReactNative
[4]: https://github.com/inaturalist/inaturalist
[5]: https://github.com/inaturalist/iNaturalistAPI
[6]: https://github.com/inaturalist/SeekReactNative/pull/731
[7]: https://www.inaturalist.org/pages/about