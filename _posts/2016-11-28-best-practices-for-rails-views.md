---
title: Best Practices for Rails Views
layout: post
date: '2016-11-28 16:43:00'
location: Orlando, Florida
categories: development
draft: true
---

Rails doesn't give people a lot of guidance regarding views. The lack of clear 
boundaries between Rails controller actions and their associated views makes 
it fairly difficult to know if you're doing something completely wrong or not.

While I could ruminate on how to fix this, there are some rules of thumb you 
can use to diminish you and your team's regrets when working with views.

## Don't ask or tell models what to do

Querying data and making changes to models is not the job of the view layer, 
that's something that should happen either directly at the controller level or 
within a service object invoked by the controller action itself.

What does that look like?[^1]

```ruby
# app/views/users/index.haml

%ul
  - User.all.each do |user|
    %li= user.name
```

This is a bad idea for several reasons. First it's not your view's job to know 
how to fetch Users. It's likely that you won't enjoy changing views once you 
notice that you only want to list users from the `User.registered` scope.

Instead, you should extract this query into a controller-level instance variable:

```ruby
# app/controllers/users_controller.rb

class UsersController < ApplicationController
  def index
    @users = User.all
  end
end
```

Then, you can refactor your view as follows:

```ruby
# app/views/users/index.haml

%ul
  - @users.each do |user|
    %li= user.name
```

That doesn't seem like much, right? But despite very similar-looking code, 
you've now *decoupled* the actual implementation of the list of users that is 
displayed on the index. All instance variables (preceded by an `@`) declared in 
Rails controllers are automatically shared with views. This may seem a bit messy
if you're a purist, but Rails is simply copying all instance variables within 
the controller *instance* and recreating them for the view *instance*. 

You may not have realized it, but since everything in Ruby is an object, your
controller and views are objects too. These objects have their own internal
state, and just like with models, an object instance can store a variable and
make it accessible to all of its own instance methods but not to other objects.

## If Conditions Then Partials

It's very common to need to display different things based on a conditional 
inside of a view. The first time a conditional is introduced it's often simple:

```ruby
# app/views/users/show.haml

%nav
  %ul
    %li= link_to "Home", "/"
    %li= link_to "Users", users_path
    - if @user.not_subscribed?
      %li= link_to "Subscribe!", subscribe_path
```

But then it almost invariably gets more complicated as time goes on:

```ruby
# app/views/users/show.haml

# ...

%nav
  %ul
    %li= link_to "Home", "/"
    %li= link_to "Users", users_path
    - if @user.not_subscribed?
      %li= link_to "Subscribe!", subscribe_path
    - else
      - if @user.premium_subscriber?
        %li= link_to "Dashboard", premium_dashboard_path
      - else
        %li= link_to "Dashboard", dashboard_path

# ...
```

Two problems are becoming obvious. First we probably should extract this 
navigation code into a separate partial so we don't have to repeat all this 
code on every page inside of this section of the site. Second, well this 
conditional was starting to grow out of control, so having it in its own file 
makes refactoring work on it a bit less urgent.

```ruby
# app/views/users/show.haml

# ...

= render partial: "navigation"

# ...
```

```ruby
# app/views/users/_navigation.haml

%nav
  %ul
    %li= link_to "Home", "/"
    %li= link_to "Users", users_path
    - if @user.not_subscribed?
      %li= link_to "Subscribe!", subscribe_path
    - else
      - if @user.premium_subscriber?
        %li= link_to "Dashboard", premium_dashboard_path
      - else
        %li= link_to "Dashboard", dashboard_path
```

It may not seem like much, but don't underestimate the power of putting things 
in the right place. There's also a bit of convention to explain: underscores
(`_name_of_partial.haml`) in front of a view filename denote a partial. Yet you 
can see we didn't call `render partial: "_navigation"`. This is because Rails 
ignores the underscore. This allows us to quickly recognize which files are 
full-fledged views called by controller actions and which are partials which 
need to be rendered from within another view.

Partials can also be shared across controllers by moving them to a higher level
directory in the tree. For example `app/views/shared/_navigation.haml` so we can 
easily share our navigation partial with views outside of of the 
`app/views/users` directory. It's possible to use an absolute path when using 
`render` in order to use partials from a different view sub-directory. For 
example `app/views/orders/index.haml` calling 
`render partial: "users/navigation"`. While it's possible to do this, I wouldn't 
recommend it because someone may see a partial inside the `app/views/users` 
directory, not realize that it's being re-used by other views, and cause 
inadvertent breakage. Placing shared partials in `app/views/shared/` is a 
healthy convention to prevent these sort of issues.
    

[^1]: Yes, I'm using Haml here, because Haml is a fantastic view language that makes for much simpler and clear examples than ERB. You can try a [Haml to ERB][1] converter if Haml offends you too much.

[1]: https://haml2erb.org/
