---
layout: post
title: "Increasing the Sidebar Font Size in Sublime Text"
date: 2016-08-09 10:17
location: "Orlando, Florida"
categories: development
draft: true
---

I still use Sublime Text. If you do to, great, I'm sure you love it. That said
if you own a screen larger than 13" it's very likely you find the default font
size in the sidebar madeningly small.

I used to wear glasses with a very strong prescription. The sidebar font size in
Sublime drove me nuts because it's one of those things so clearly created by
someone who has excellent vision — or someone who just doesn't
know what's good for them. Squinting at a screen is good for no one.

Last year I had LASIK. No more glasses. Near "perfect" vision. Still, the
Sublime Text sidebar font size gives me headaches. On this 9th day following the
anniversary of my bionic eyes, let's fix this damn sidebar for good.

## PackageResourceViewer

This step assumes you have [Package Control installed](https://packagecontrol.io/installation).
If you don't, go do it, trust me, you're missing on a world of Sublime goodness.

It appears that the files we need to modify (at least in Sublime 3) are now
zipped and not as easy to edit as they were in Sublime 2. If you're still on
Sublime 2 the file names should be the same and you probably won't need this
step.

On Sublime 3, run `Shift` + `Command/Control` + `P`.
Select `Package Control: Install Package`, then type `PackageResourceViewer` and
press `Enter` to install it.

![Screenshot of how to open the Install Package mode]({{ site.url }}/assets/sublime-sidebar-install-package.png)

Now that it's installed, you can summon PackageResourceViewer with the `prv`
command inside of the `Shift` + `Command/Control` + `P` prompt.

## Open Resource

Let's open the resource we need to modify in order to fix this damn sidebar.
First `Shift` + `Command/Control` + `P`, then type `prv open` and `Enter`.

![Screenshot of how to run prv open]({{ site.url }}/assets/sublime-sidebar-prv-open.png)

You should see a list of resources. At this point your current theme name is
going to matter a lot. If you're using the default theme (you animal!) you can
just type `Default.sublime-theme` and `Enter` to modify that. If you're anything
like me, you have a roster of different themes that you rotate through. I use
the **Themr** package to list and switch themes, so before remembering which
theme I was currently using I had to check Themr's `List themes` command. That
said one quick scroll through your user preferences (`Command/Control` + `.`)
and you should be able to figure out the name of the theme you're using.

When you know for sure which theme you're using, type its name in the `prv open`
listing and it should filter it down to a few results. You're looking for a
`.sublime-theme` file. I'm using `Sodarized Dark`. So first I had to open the
`Theme - Sodarized` directory, then select the `Sodarized Dark.sublime-theme`
file.

![Screenshot of how to open the Install Package mode]({{ site.url }}/assets/sublime-sidebar-filter-sodarized.png)

![Screenshot of how to open the Install Package mode]({{ site.url }}/assets/sublime-sidebar-selecting-theme.png)

If you pick the wrong file, the final step will have no immediate effect so
it'll be easy to come back to this one and try a different file.

## Modifying the Theme

![Screenshot of an open .sublime-theme file]({{ site.url }}/assets/sublime-sidebar-sodarized-dark-theme-file.png)

We're almost done! Wooh! Use your trusty old `Command` + `F` to find the
`sidebar_label` property. This is what defines the style for the text label
that displays file and directory names in the sidebar.

![Screenshot of the sidebar_label property]({{ site.url }}/assets/sublime-sidebar-sidebar-label.png)

To start adjusting the font size you'll need to add a new property called
`"font.size"`.

Before I changed it, my Sodarized Dark `sidebar_label` settings looked like this:
```
{
    "class": "sidebar_label",
    "color": [52, 106, 127],
    "shadow_color": [0, 0, 0],
    "shadow_offset": [0, -1]
}
```

After, they looked like this:
```
{
    "class": "sidebar_label",
    "color": [52, 106, 127],
    "shadow_color": [0, 0, 0],
    "shadow_offset": [0, -1],
    "font.size": 16
}
```

Don't forget to add a comma (`,`) at the end of the previous property's line
(`shadow_offset` in this case) otherwise you'll cause a syntax error.

I recommend playing with the `font.size` value. I settled on `16` but only
after messing with the `sidebar_tree` property's `row_padding` values that
determine the padding (spacing) within each sidebar row.

I found that changing them from their default value of `[8, 3]` to `[8, 5]` made
the sidebar rows much easier to read.

I'd recommend making a backup of the original values. Otherwise you can always
remove the Theme package you were modifying and re-install it from Package
Control. That should restore the default theme settings.

