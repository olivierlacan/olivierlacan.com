---
layout: post
title: "Delaying the IE Showdown"
date: 2011-12-06 20:27
comments: true
categories: development
---
I asked the lovely people on Twitter how they dealt with Internet Explorer during their development process in 2011 and what tools they used to do so.

[My initial question](https://twitter.com/olivierlacan/status/144039798145957890)

Alan – nicest guy in the world & very talented lead developer of [Treehouse](http://teamtreehouse.com) was the first to opine: 

[Alan 1](https://twitter.com/commondream/status/144040509885784064)
[Alan 2](https://twitter.com/commondream/status/144040553057755137)
[Cory 1](https://twitter.com/coryperry/status/144041538052304897)

I then asked a follow-up.

[Follow-up](https://twitter.com/olivierlacan/status/144042582291398657)

[Alan 3](https://twitter.com/commondream/status/144042513739694080)
[Alan 4](https://twitter.com/commondream/status/144042750520729600)

Speaking of talented fellas, Nick – a web designer at [Envy Labs](http://envylabs.com) who worked on [Code School](http://codeschool.com) and the fabulous Why-flavored redesign of [TryRuby.org](http://tryruby.org) – answered:

[Nick 1](https://twitter.com/nickawalsh/status/144042925922336768)
[Cory 2](https://twitter.com/coryperry/status/144042963339722753)

Ryan – a swell guy from NY, designologist, co-founder and web designer at [Think Bigr](http://thinkbigr.com) – replied:

[Ryan 1](https://twitter.com/ryanbarresi/status/144043308572880896)

Last but not least, Mark – a terrific web designer at [Shopify](http://shopify.com), said:

[Mark 1](https://twitter.com/markdunkley/status/144073547038461952)

To conclude almost every single response presented an approach where styles are written in a standards-compliant environment (today that would be Chrome or Safari, more so than Firefox) then adjusted for IE's obsolete ways.

Keep this in mind, because a production process tied by IE-compatibility from the get-go is likely to create frustrations and creative limitations very early on. It doesn't mean one shouldn't consider IE before the end-stages of a project (as Nick pointed out, the demographic matters a lot) but be weary of efforts towards graceful degradation that may be rendered unnecessary by late design decisions.

Project managers are rarely as cautious with CSS since it doesn't directly impact business logic (back-end), which means they are more likely to propose modifications to styles later on in a project than they would with controller-logic that could cause functionality breakage.

Managers also often expect websites to [look the same in every browser](http://dowebsitesneedtolookexactlythesameineverybrowser.com/). If you catch any flak when adopting such a process, don't hesitate to point out that many web professionals adopt a similar technique because it is the most efficient use of their time. Going and back and forth between standard CSS and IE fallbacks after each design iteration is a waste of your time and their money.

If managers or clients somehow insist of having fully IE compatible sites after each iteration, several people have suggested introducing an IE tax to give everyone a clear picture of the [true cost of obsolete browsers](http://www.informationweek.com/news/windows/microsoft_news/229401795) on development schedules.

I highly recommend Andy Clarke's thorough [breakdown of his Canny Bill redesign](http://stuffandnonsense.co.uk/blog/about/what_does_browser_testing_mean_today/) across progressively less advanced browsers and his benchmark browser approach.

Finally, one of the best tools to further the cause of graceful degradation (a much more logical moniker than "progressive enhancement") is [Modernizr](http://www.modernizr.com/), spearheaded by [Faruk Ateş](http://farukat.es/), [Paul Irish](http://paulirish.com) and [Alex Sexton](http://alexsexton.com/).