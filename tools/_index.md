---
layout: default
title: Tools
---

# Tools

## JavaScript
### [Lettering.JS](letteringjs.com)
A fantastic library if you want to excercized minute control over web typography in a very friendly way.

### [Raphaël](http://raphaeljs.com/)
Vector graphics generation through JavaScript to create charts or image crop & resize tools.

### [DoTimeout](https://github.com/cowboy/jquery-dotimeout/)
A smart wrapper around JavaScript's setTimeout, chainable like any good jQuery plugin and which gives you much more granular control over delayed code execution.

### [DropKick](http://jamielottering.github.com/DropKick/)
Visually elegant and cross-browser dropdown `<select>` elements are a major pain and DropKick takes almost all of it away with a clean API and swappable themes.

### [FancyBox](http://fancybox.net/)
Years after its release, FancyBox is still by far the best implementation of the JavaScript "lightbox" out there. Version 1.3.4 is the last version available without a paid license and it's more than sufficient for most uses. 

What seals the deal for me is the beautifully intuitive "elastic" animation which clearly helps users understand the interaction as the full size image seems to expand from the size of the original thumbnail on click. It also offers a very simple way to create galleries out of several thumbnail links by simply adding an identical`rel` property. Galleries are then browsable by hitting the left and right arrow keys, a scrollwheel or trackpad or links displayed while hovering on the left or right side of the full size image.

### [jQuery File Upload](http://blueimp.github.com/jQuery-File-Upload/)
Without a doubt the single best cross-browser uploader available today. And guess what? It doesn't use Flash at all. Its creator, Sebastian Tschan, has created a fantastic API for the plugin which allows you to control pretty much anything after initializing the plugin. It offers plenty of callbacks for all necessary events (file selection, successful or failed upload, etc.).

On modern browser the plugin also has a few extensions like Load Image which offers thumbnails of selected files prior to upload or a UI version which displays all successfully uploaded files in a table allowing users to delete erroneous uploads before submitting a form.

In case you're wondering, the plugin uses Iframe transport as a fallback for all versions of IE which don't support XMLHttpRequest (AJAX).

### [FlexSlider](http://www.woothemes.com/flexslider/)
If you're building a responsive website (and you should be), FlexSlider by Tyler Smith is a pre-packaged solution to offer a slider that will adapt to all possible proportions of your website.

It doesn't cover every possible situation (you can't make a full-width slider for instance) but it offers a very neat API with plenty of customizable options for a modern slider.

### [FormatCurrency](http://code.google.com/p/jquery-formatcurrency/)
Yes, project hosted on Google Code are scary but this seems reasonably well maintained although considering how good it is, it's a shame it's not availablle to the mass of contributors on GitHub. 

Basically, if you ever need to handle currency within a form, you want to be using this plugin. It will allow you to check and format any user input into proper floating point numbers with the right amoung of decimals. It can format as the user types to avoid mapping problems, for instance it will automatically prepend a dollar sign before an amount if you want to be explicit. 

It will also automatically separate groupings ("thousands, hundreds, etc") with your chosen separator, drop unwanted decimals, round numbers to the nearest decimal place, etc.

### [qTip2](http://craigsworks.com/projects/qtip2/)
Speaking of powerful APIs. There a dozens of projects attempting to solve the problem of tooltips around the Web. Some are neat, many are not supported anymore and two of the best ones are now under commercial licenses, making them hard to justify on non-commercial projects. 

qTip2 has an extremely extensive and powerful API. I can't say it's the most intuitive API but it's well maintained enough that you can ask its developer – Craig Thompson – for help on GitHub issues and expect a prompt answer.

I don't think I've managed to find one thing qTip2 couldn't do in 2 months of using it on a project which required a *lot* of tooltips. But I have to admit I wish it implemented the "hover intent" pattern (as [presented masterfully by Doug Neiner](https://github.com/dcneiner/jQuery-Bling)) by default.

When you decide to give it a try, remember that tooltips are positioned absolutely and that if the elements triggering the tooltips are floated, you want to be using `overflow: hidden` on their parent element in order to trigger `hasLayout`. Otherwise you will wonder why tooltips seem to be shifted up or downward like I originally did.

### [selectivizr](http://selectivizr.com/)
CSS3 came with a set of extremely useful selectors that made it much easier to target a specific children of an element for instance. It liberated us from having to define a `.first` and `.last` class on lists. Except many of those fabulous selectors like `nth-child`, `first-child`,  or `nth-of-type` are not supported __at all__ by this sad excuse for a browser we call IE.

Yet, if jQuery can allow us to use these selectors on any browser, why couldn't we sprinkle some JavaScript magic to do the same with our stylesheets? 

Well that's exactly what selectivizr does. And while it has differing levels of support depending on the JavaScript library you're using (jQuery, MooTools, dojo, prototype, etc.), it makes the most crucial ones available everywhere.

## Ruby
### [CarrierWave](https://github.com/jnicklas/carrierwave)
In my the absolute best library to deal with file uploading in Rails. Better yet, it integrates seamlessly with [Fog](https://github.com/fog/fog) which allows you to directly upload files to an Amazon S3 bucket.

### [Bourbon](https://github.com/thoughtbot/bourbon)
When [Compass](https://github.com/chriseppstein/compass) had compiling time issues with Rails 3.1.x I went with this much lighter gem. It doesn't provide some of the most crucially useful features of Compass (automatic sprites generation for instance) but it does offer a wide array of cross-browser CSS3 mixins which will make your life a lot easier.