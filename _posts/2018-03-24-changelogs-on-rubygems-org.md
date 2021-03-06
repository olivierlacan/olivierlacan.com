---
title: Changelogs on RubyGems.org
layout: post
date: '2018-03-24 18:11:00'
location: Paris, France
categories:
  - ruby
image: changelogs_on_rubygems.png
---
![RubyGems.org screenshot showing the new changelog link in action][screenshot]

Did you know that changelog URLs have been valid metadata [since
2017][merged] on [RubyGems.org][rg]? If you maintain a gem you can now make
it easier for your users to find out what's changed in a specific version.

You can easily update your gems's [`.gemspec`][gemspec] to point to a rendered
or plain text version of your changelog using the `changelog_uri` key in
the `metadata` hash, like this:

```ruby
Gem::Specification.new do |s|
  s.name        = "Tapdance"
  s.version     = Tapdance::VERSION
  s.license     = "MIT"
  s.summary     = %q{ Make tap dance on nil }
  s.description = %q{ With tapdance you can call tap on nil and it will swallow gamma rays like a collapsing wormhome! }
  s.homepage    = "http://github.com/olivierlacan/tapdance"
  s.authors     = ["Olivier Lacan"]
  s.email       = ["hi@olivierlacan.com"]
  s.files       = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.metadata    = {
    "homepage_uri" => "https://github.com/olivierlacan/tapdance",
    "changelog_uri" => "https://github.com/olivierlacan/tapdance/blob/master/CHANGELOG.md",
    "source_code_uri" => "https://github.com/olivierlacan/tapdance/",
    "bug_tracker_uri" => "https://github.com/olivierlacan/tapdance/issues",
  }
end
```

You can use the metadata hash for a lot of other URIs relevant to your project
like `homepage_uri`, `source_code_uri`, and `bug_tracker_uri`.

Note that I'm using the [GitHub URL for the changelog][rendered] above when a
link to the [raw source][markdown] would have worked just as well. Since [good
changelogs][kac] are made for humans, I strongly recommend you point people to
the rendered HTML output of a nicely formatted Markdown (or other markup source
language) changelog.

It's also fine to link to a project website that formats the rendered
output from the project changelog, [like Ember does][ember]. You can even link
to the [GitHub Releases page][gh-releases] if you generate release notes using
git tags on GitHub.

## Version-specific Changelog Links

What's great about the way [Keenan Brock][keenan] implemented this feature compared to my
[original proposal][proposal] is that along with other gemspec metadata, the
changelog URI can be different between different versions of a gem.

This means that if your project has version-specific changelogs files, you can
point people who look at version 0.1.0 on rubygems.org to a `changelog-0-1-0.md`
file that only lists changes within this minor version.

## Keeping a Changelog

What if your project doesn't have a changelog? Or if instead you simply point
people to git diffs of the commits between each version.

About a year after making the original pull request to add these
changelog links to RubyGems.org, I created [keepachangelog.com][kac].
Give it a read if you're not sure what a changelog should
contain or why you should keep one for your project.

[keenan]: https://twitter.com/kbrock
[rg]: https://rubygems.org
[merged]: https://github.com/rubygems/rubygems.org/pull/1553
[gemspec]: http://guides.rubygems.org/specification-reference/
[screenshot]: {{ site.url }}/assets/changelogs_on_rubygems.png
[kac]: https://keepachangelog.com
[ember]: https://emberjs.com/blog/2017/03/19/ember-2-12-released.html
[markdown]: https://raw.githubusercontent.com/olivierlacan/keep-a-changelog/master/CHANGELOG.md
[rendered]: https://github.com/olivierlacan/keep-a-changelog/blob/master/CHANGELOG.md
[proposal]: https://github.com/rubygems/rubygems.org/pull/728
[gh-releases]: https://github.com/olivierlacan/keep-a-changelog/releases
