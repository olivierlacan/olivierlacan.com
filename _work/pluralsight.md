---
layout: page
date: 2016-08-01 00:00
end:
title: Pluralsight
categories: work
---
Throughout my tenure at Pluralsight, I've focused on three major areas: 

- seed list for toc
{:toc}

### Content Libraries

<summary>Multi-modal content packaging and platform-wide automation</summary>

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

### Innersource

<summary>Distributed data publication and processing.</summary>

### UCDM

<summary>Unified content data modeling.</summary>

### Projects

<summary>Hands-on interactive learning and authoring tools</summary>

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