---
layout: post
title: "Optimizing the Wrong Code"
date: 2014-10-23 07:46
location: "Paris, France"
categories: development
---
Today I was going through some of our worst queries on [Skylight](http://www.skylight.io/r/YNE-Q1twTyT-) and trying to find some [low-hanging fruits](http://en.wiktionary.org/wiki/low-hanging_fruit) to improve performance with the least effort possible. I like Skylight because it's a tool designed to reduce noise. Whenever you get into the optimization mindset, noise is your worst enemy. It turn the most innocent pursuit of necessary speed improvements into a rabbit hole chase of diminishing gains.

After a few successful optimizations for which I successfully [added table indices and compound indices](https://tomafro.net/2009/08/using-indexes-in-rails-choosing-additional-indexes) to dramatically speed up some queries on very large tables, I found that our [Report Card](http://codeschool.com/users/olivierlacan) had a ridiculously slow SQL query in it taking basically 50% of the request time.

![Request Trace from Skylight]({{ site.url }}/images/users-show-trace.png)

Much to my surprise, that terribly slow (about 700 ms) query appeared very simple:

```sql
SELECT  "users".* FROM "users"  WHERE ("users"."username" ILIKE ?) LIMIT 1
```

`ILIKE` is a Postgres-specific [case insensitive `LIKE` comparison](http://www.postgresql.org/docs/9.3/static/functions-matching.html).

Since I had spent so much time researching, analyzing, and implementing table [indices](http://english.stackexchange.com/a/3126) my first instinct was to research the possibility of adding an index to this ILIKE clause and I did find some interesting information about using Postgres' [Trigram extension](http://www.postgresql.org/docs/9.1/static/pgtrgm.html) to make a relatively fast [GIN index](http://www.postgresql.org/docs/9.3/static/gin-intro.html) on this relatively tricky clause.

I got started on adding a migration to our database to enable the pg_trgm extension in Postgres but remembered that database extension support was only [added to Rails' `schema.rb` files in Rails 4.0](https://github.com/rails/rails/pull/9203) and for now at least we're still running a patched Rails 3.2 so I wouldn't be able to make this migration portable without switching to a `structure.sql` file which is a nope.

Then to clear my mind a little bit I searched for the line of code that was triggering this rogue query.

```ruby
User.where(User.arel_table[:username].matches(params[:id])).first
```

Now, I understand that using hardcoded SQL strings in Rails feels weird. That said — and I'll admit I forgot what I base this opinion on — I consider Arel a private Rails API. It may not change often and unpredictably but I will treat it as if can. Harcoded SQL strings on the other hand are unlikely to surprisingly break with no deprecation notice. I'm aware someone could extend this line of argument to say mean things about ActiveRecord but I think that's silly. ActiveRecord has an API and when it changes we generally tend to hear about it ahead of time.

What really bothers me here is that this `User.arel_table[:username].matches(params[:id])` is completely obfuscating the `ILIKE` statement it generates. If you don't call `to_sql` on this thing, or see the full SQL output in your console or on something like Skylight, you won't notice it's doing something potentially very slow.

And then it hit me. Why the hell were we doing an `ILIKE` query? If a user matches the username in a URL, it should be displayed. It's not like the goal of this action was to display usernames that start with `params[:id]` and maybe end with something else like a `where("username ILIKE ?", "#{params[:id]}%")` would. No this was purely focused on dealing with the problem of case. If someone typed in `OlivierLacan` we want to look for the username `olivierlacan` or `OLIVIERLACAN` or `OlIvIeRlAcAn`.

We could use `User.where("lower(username) = ?", id.downcase).first` instead and considering we already have an index on the `username` column this would be much faster. In the best cases that would take the query down to 270 ms.

That's when I remembered that we had an internal column named `system_username` where we simply lowercase the `username` column every time it's updated. That meant I could let Ruby deal with the (easy) job of downcasing a string:

```ruby
User.where(system_username: params[:id].downcase)
# or
User.find_by_system_username(params[:id].downcase)
```

Query speed? 1 milisecond. Instead of optimizing the database for inefficient code, I ended up rewriting the code to be less silly and take advantage of prior optimizations we had (thankfully) done. I didn't have to install a Postgres extension usually reserved for full-text search, and — more importantly — I didn't have to create a potentially costly index on an operation (the case insensitive comparison) that ended up being unnecessary.

PS: I'll be following this post up with a new one detailing my methodology with the more indexing-focused performance optimizations I mentioned at the beginning. If you have any tips and tricks in your toolbag, please send me a quick email to let me know so I don't look silly. Here are [some of mine](https://gist.github.com/olivierlacan/dc56a96bb2fd3742db5b).
