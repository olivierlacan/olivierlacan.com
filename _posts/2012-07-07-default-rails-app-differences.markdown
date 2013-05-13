---
layout: post
title: "Rails Blank Slate Differences"
date: 2012-07-07 17:37
comments: true
categories: "rails"
---

## The Problem
Upgrading Rails apps has become a lot easier over the years. Most of the time you can simply update your Gemfile, try to `bundle` and make sure all your existing Gems are compatible with the new version, if not run `bundle update <gemname>` on each of them one at a time until all dependencies resolve and then finally run `rake rails:update`, letting Rails make sure you're setup properly for a new version.

The problem is that new versions of Rails often come with new default configrations inside of the following files and directories:

* `config/application.rb`
* `config/environments/development.rb`
* `config/environments/production.rb`
* `config/initializers/`
* `Gemfile`

And there's always a lot to learn from those new default configuration. Even if we should, we don't often catch all the subtle changes and improvements made to those Rails defaults. The result is that problems arising from upgrading to a new Rails version often come from not knowing about these new defaults.

To address this, Jacob Swanner had written a blog post for the Envy Labs blog last year offering [useful Git diffs](http://blog.envylabs.com/2011/10/upgrading-to-rails-3-1-1/) for the modified files between several different Betas and Release Candidates of Rails 3.1 and the 3.1.1 final release.

## The Solution
Dwayne Henderson took it one step further by writting a useful Bash script that automated this process between a selected "old version" and the newest version of Rails available. Making it a lot less painless to get relevant information for the versions you care about.

## Refining the Solution
His script didn't really work on my system so I took it as an opportunity to improve it a bit and despite my serious illiteracy when it comes to Bash scripting, I came up with a version that:

* uses Bundler instead of RubyGems to create a version-specific skeleton Rails app, it's much faster and doesn't mess with your system Rubies or RVM Gemsets
* allows you to set which `new_version` of Rails you want to compare with the `base_version`
* if `new_version` is left blank it compares against the latest stable version of Rails
* provides descriptive colorized output for all actions being done by the script
* outputs the resulting Git diffs to your system's default `$EDITOR` instead of less

{% gist 3068005 rails_default_diff.sh %}

[**Download the script here**](https://gist.github.com/raw/3068005/70431270f82a826a97ce8e854a87995ce782999a/rails_default_diff.sh) and make sure you save it as a `rails_default_diff.sh`.

Here's an [example diff from Rails 3.1.4 to 3.2.6](https://gist.github.com/3068318).

## Possible Improvements
I would love it if someone could help me test this script to make sure it works across environments and not just on my local machine, since I use ZSH and OS X I don't know if this will act the same elsewhere. 

Better yet, Jacob mentioned it would be a great idea to directly ping the Rails repo on GitHub for specific version tags to perform this without even needing to install new Rails versions locally. He's working on a solution for that.

Finally, I think it would make sense to create a web service that outputs differences between blank slate Rails apps when you query it like this: `site.org/from/v3.1.4/to/v3.2.6`