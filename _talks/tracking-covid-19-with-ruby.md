---
layout: talk
date: 2020-11-17 15:00
title: Tracking COVID-19 with Ruby
categories: talk
venue: RubyConf 2020
---

### Video

<iframe width="560" height="315" src="//www.youtube.com/embed/lRUq3ZJHXKE" frameborder="0" allowfullscreen></iframe>

### Slides

<script async class="speakerdeck-embed" data-id="4e1cb0d1b168431e9041a8abd5b77561" data-ratio="1.77777777777778" src="//speakerdeck.com/assets/embed.js"></script>

### Abstract

Programmers are not epidemiologists, but epidemiologists have never needed programmers more. Not for our viral opinions but for our ability to retrieve large data sets and make them understandable through expressive code. As the pandemic was silently taking hold in the United States in early 2020, I used simple web and Ruby tools to gather invaluable data from often obscure state data sources in order to understand the extent of the pandemic in my area. I never expected this would lead me to become a contributor to the pirate CDC.

#### Details

In this talk I’ll walk viewers through my somewhat unique perspective on the early days of the pandemic. Having a co-worker whose wife lives in Wuhan, I was exposed to the dire reality early on, and quickly grew concerned at the utter lack of epidemiological data in my city, county, state, and country.

After discovering the Johns Hopkins University worldwide dashboard I went hunting for any local government data on the impact of the pandemic only to discover the early iterations of a dashboard which would become infamous mere months later.

That dashboard eventually led me to raw JSON data feeds which were clearly not intended to be independently processed despite being publicly available. Along with volunteers, epidemiologists, journalists, and other web folks, I posted over data definitions, hounded state health department officials, and wrote hundreds of lines of Ruby code to retrieve, process, and understand the evolving COVID-19 situation in my home state.

The process allowed me to dive deep into the riches of the Ruby language and ecosystem. All my work was open source since the start and much of it stood the test of time by fueling critical data gathering efforts which contributed to essential reporting about the extent and severity of then pandemic at times when officials were blatantly misleading their constituents about the meaning of key metrics.

My basic structure will follow:
- the hunt for reliable and canonical COVID-19 data
- scrapping and increasingly large quantities of highly unreliable data with a basic Rack application
- scaling and refactoring Ruby code to handle memory, network, and API limitations

The intended audience of this talk should range from beginners who seek to understand if Ruby is capable of handling large data processing needs (as opposed to Python for example) all the way to more experienced Rubyists who may need reminding that we have many excellent and productive tools at our disposal even without reaching for Rails.


