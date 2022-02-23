---
layout: post
title: "Rails on iPad"
date: 2022-02-22 10:27
update: 2022-02-14 15:40
location: "Orlando, Florida"
categories: development
summary: It's finally possible to fully develop a Rails app on an iPad
image: rails-on-ipad.jpg
draft: true
---

{% include image.html
name="rails-on-ipad.jpg"
alt="Look at that iPad running a Rails app" %}

The day I first held an iPad in my hands on April 3rd, 2010 I dreamed of
being able to do what I'm doing right now. It has been possible to have
a partial development environment in the browser for many years. A huge
part of Heroku's appeal when it launched... [14 YEARS AGO][heroku] was
to allow Ruby effortless Ruby development in "the cloud".

This weekend I [giddily tweeted][tweet] that I
managed to get [GitHub Codespaces][codespaces] to run a *full* Ruby on
Rails development environment on my iPad. 

Truly it wasn't until I started a friendly Twitter mob to figure out how
to properly [talk to Postgres][fixed], but with the help of kind Internet 
folks like [Alyss Noland][alyss], [Avdi Grimm][avdi], 
[Benjamin Wood][wood], and [Justin Bowen][bowen] it all worked out

So maybe you'd like to develop a Rails app on your iPad too? Or maybe 
an Elixir, Python, .NET, or even a Swift one? 

## Developing an app in the comfort of your iPad browser

First, since Codespaces is a GitHub feature. You're going to need a 
[GitHub account]. Yes, I'm not going to make any assumptions here. Skip
ahead if you prefer. 

While I wish you could start from scratch with an empty repo, it seems 
like Codespaces doesn't support that yet. So you'll either need a base 
repository with some code to allow Codespaces to create the Development 
Container (or devcontainer) configuration files... or you could just 
copy the default configuration from [Microsoft's Ruby on Rails & Postgres][rorpg]
which is what GitHub's VSCode web editor will offer.

I'm only recommending this method because it mirrors what Codespaces 
would create if you used the 
`Codespaces: Configure Development Container Features...` feature inside 
of the GitHub VSCode web editor.

1. Create all of the files [listed here][config] inside of a `.devcontainer` 
directory. You can use GitHub's nifty (but hard to discover) code copy 
button. You will likely be very annoyed that Safari[^1] keeps starting 
each filename with an uppercase letter, which can be avoided by type 
`Ffilename` and deleting the first letter afterwards.
{% include image.html
name="rails-on-ipad-code-copy.png"
alt="Screenshot of the GitHub file content copy button" %}
3. Once you've added all the files, just come back to the file 

## Development Container Configuration Reference
[As of now][commit] it contains just [four files][devconfig]: 

- `docker-compose.yml`: creates one Docker container for Ruby and one
for Postgres, telling the Ruby one two run on the same network as the
Postgres one so that the database is available on `localhost` port
`5432` (the Postgres default). It's important to note that some 
folks might be used to doing things differently with Docker Compose by 
referencing the database container by its service name (`db`). This is 
the way [Benjamin Wood suggested to me][woodexample] but it's different 
enough from the default GitHub/Microsoft offers that I'd recommend 
against it. 
- `Dockerfile`: referenced by the `docker-compose.yml` file and 
specific to the Ruby container, it includes some additional 
configuration, for example to pick and use a Node version for bundling 
JavaScript packages with or install some default gems. 
additional 
- `devcontainer.json`: central configuration file that points to the 
`docker-compose.yml` file as the way to configure the container(s), lists
Codespaces-specific VSCode extensions to install, and tells Codespaces 
to connect as the `vscode` user instead of `root`.
- `create-db-user.sql`: referenced the `docker-compose.yml` section that 
defines the `db` container for Postgres, it creates a non-admin Postgres
user which can be used instead of the `postgres` default user. 

## Is this exclusive to GitHub?

Nope. As you can see from the `devcontainer/` configuration files there
is nothing inherently GitHub specific about spinning up a containarized
development environment. You can already use [Development Containers][dc] 
on your machine (if you can or *want to* install Docker on it) and there 
appear to be at least [one Codespaces alternative][coder] out there. 
I'm sure there are and will be many more.

[heroku]: https://techcrunch.com/2008/02/07/heroku-lifts-ruby-on-rails-development-to-the-cloud/
[tweet]: https://twitter.com/olivierlacan/status/1495144364338724873
[codespaces]: https://github.com/features/codespaces
[coder]: https://coder.com/blog/coder-the-github-codespaces-alternative
[dc]: https://docs.github.com/en/codespaces/setting-up-your-project-for-codespaces/configuring-codespaces-for-your-project
[fixed]: https://twitter.com/olivierlacan/status/1496004934126522368
[alyss]: https://twitter.com/preciselyalyss
[avdi]: https://twitter.com/avdi
[wood]: https://twitter.com/benjaminwood
[bowen]: https://twitter.com/tonsoffun111
[rorpg]: https://github.com/microsoft/vscode-dev-containers/tree/main/containers/ruby-rails-postgres
[commit]: https://github.com/microsoft/vscode-dev-containers/tree/0f75b3457b78245d79d326c2ae54c37c37231a20/containers/ruby-rails-postgres
[devconfig]: https://github.com/microsoft/vscode-dev-containers/tree/main/containers/ruby-rails-postgres/.devcontainer
[config]: https://github.com/microsoft/vscode-dev-containers/tree/0f75b3457b78245d79d326c2ae54c37c37231a20/containers/ruby-rails-postgres/.devcontainer
[cap]: https://developer.apple.com/library/archive/documentation/AppleApplications/Reference/SafariHTMLRef/Articles/Attributes.html#//apple_ref/doc/uid/TP40008058-autocapitalize

[^1]: If you work at GitHub, this can easily be fixed by using the 
[`autocapitalize="none"`][cap] HTML input element property. Please and thank you.