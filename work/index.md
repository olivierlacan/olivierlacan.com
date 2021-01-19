---
layout: page
title: Work
---
### Pluralsight

#### Content Libraries

After Pluralsight acquired and developed several new experience which offered
learners different types of content to consume beyond video courses, the team
where I served as tech lead was tasked with developing a new system in
conjunction with our Authorization and Product Catalog teams to migrate our
legacy infrastructure from only being able to handle one content type (video
courses) to multiple content types (labs, projects, guides, etc).

This new system enables more customized pricing and packaging of content and
compressed the overhead for creating or updating custom slices of content for
specific customers from one week to a few minutes.

This effort was particularly challenging due to the distributed nature of
systems at Pluralsight but also due to the different needs of stakeholders
who curate and maintain libraries of content at Pluralsight. We spent several
weeksk with engineers, our product manager, and product designer carefully
documenting the legacy system we were bound to replace, interviewing all
current and potential future stakeholders.

We rolled out our new system, imported legacy data from the old system within a
few months, then worked across teams to support the rollout of a new Authorization
version based on our new system. Within 8 months, we had successfully helped
multiple teams including our own migrate to the new infrastructure.

#### Projects

<figure>
  <img src="{{ site.url }}/assets/projects-build-check-my-work.png" alt="Screenshot of the Projects Build interface showing feedback given to the learner when tasks aren't successfully completed">
  <figcaption>
    Projects offers feedback to learners when tasks aren't successfully completed.
  </figcaption>
</figure>

As a senior software engineer on [Pluralsight's
Projects](https://www.pluralsight.com/product/projects) team where we developed
interactive ways for people to achieve proficiency with new technologies they
recently discovered either through video or interactive courses.

We initially created Projects inside of Code School back in 2016 to fill
a need expressed by our students. Despite gaining a lot of theoretical and
practical knowledge of a new technology while going through a Code School
interactive course like Rails for Zombies, many of our students didn't know
where to start in order to apply their newly acquired skills.

Projects solves this blank page problem by offering students a tightly scoped
Project to work on, starting with a failing test suite which serves as a list
of tasks to slowly work through. This allows people to become familiar with
the flow and process of software development in an environment with a tight
feedback loop. Since exceptions and setup issues often results in dead ends
for newcomers to a technology, we try to provide the most specific feedback
possible by not only executing tests written by our authors against the code
written by our learners but also guiding them through the environment-specific
errors that occur when their code is executed or built.

Projects was initially extracted from Code School as a Rails REST API and GraphQL
backend and a React UI front-end. We integrate with the rest of the Pluralsight
ecosystem with RabbitMQ, REST APIs, and Kafka.

### Code School

<figure>
  <img src="{{ site.url }}/assets/codeschool-account-page.png" alt="Screenshot of the Code School account dashboard">
  <figcaption>
    The Code School account dashbord allowed you to track the course you were currently playing, recently earned activity
    or course completion badges, progress on given learning paths, but also find your team dashboard, and other settings.
  </figcaption>
</figure>

I served as Tech Lead on [Code School](http://codeschool.com)'s
Platform team where I built and maintained the Ruby on Rails application
that powered [codeschool.com](http://codeschool.com).

Throughout the years I've been responsible for upgrading our Rails
infrastructure from version 3.1 to 5.0; maintaining our security bug
bounty; and course building and maintaining billing, team management,
and authorization features for the platform.

I've also worked with our content team to produce interactive challenges
for several courses, and contributed to the development of Code School
Projects which allow students to complete step-by-step tasks on their
own machines or on GitHub while receiving interactive feedback about
their progress along the way.

Several years ago, when Code School was still a baby startup I wrote
and taught in several of our excellent interactive courses:

#### [Try Git](http://try.github.com)

<figure>
  <img src="{{ site.url }}/assets/try-git-demo.gif" alt="Quick animated demo of the Try Git interactive course interface in action.">
  <figcaption>
    Try Git had a simplified interface which mimicked a terminal window to help people get acclimated to a command line interface like git.
  </figcaption>
</figure>

I wrote this short course with the Code School and GitHub teams. We
reproduced a command line terminal to execute real git commands and
produce output in order to help people quickly become familiar with git
without being intimidated. Try Git was released on July 4th, 2012 and
announced by [GitHub on their blog][1]. It has attracted over 5 million
unique visitors since.

[1]: https://github.com/blog/1183-try-git-in-your-browser

#### [Testing with RSpec](http://www.codeschool.com/courses/testing-with-rspec)

This was my first Code School course as an on-camera instructor. I
learned most of what I know about RSpec while working on this course.

#### [Git Real](http://www.codeschool.com/courses/testing-with-rspec)

My second Code School course as a teacher. It visually and interactively
explains the concepts of staging, remote repositories, branching, and
especially rebasing.

### Open Source

Over the years I've regularly created and maintained my own open source
projects and contributed to several popular projects.

[Find out more about my open source work.](/oss)

### Podcasting
#### [Ruby Facets](http://rubyfacets.com)
A spiritual successor to Ruby5 since it ended, Ruby Facets was a short, sweet,
and short-lived Ruby news podcast that covered new releases, interesting blog
posts, and relevant events in the Ruby and Rails community.

#### [Ruby5](http://ruby5.envylabs.com)
I first started podcasting with Gregg Pollack and the rest of the
Envy Labs & Code School team that rotated on the show. Over time I
became a regular co-host, until the show ended on September 20th, 2016.
