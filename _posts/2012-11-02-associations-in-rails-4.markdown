---
layout: post
title: "Associations in Rails 4 (Erratum)"
date: 2012-11-02 02:43
comments: true
categories: development
---

**Update (2013-12-29)**: I can't believe I've never corrected this post over the last year. The changes in JSON output I describe below have nothing to do with Rails 4. What I (shamefully) forgot to mention was that I had replaced jbuilder with [active_model_serializers](https://github.com/rails-api/active_model_serializers) in the app I was testing Rails 4 with, that is why the JSON output was different.

Associations in Rails 4 return a CollectionProxy instead of an Array. Calling a model's association in Rails 4 might yield ~~some surprises and unexpected breakage if you don't take a careful look at what's changed~~ no difference whatsoever.

Considering two models with a has_and_belongs_to_many (HABTM) association to each other.

```ruby
class Article < ActiveRecord::Base
  has_and_belongs_to_many :tags
end
```

```ruby
class Tag < ActiveRecord::Base
  has_and_belongs_to_many :articles
end
```

## Array vs. CollectionProxy

First, let's create some records to play with.

```ruby
tag = Tag.create(name: "Movie")
#<Tag id: 1, name: "Movie", created_at: "2012-11-02 06:18:29", updated_at: "2012-11-02 06:18:29">

article = Article.create(title: "Inception", tag: tag)
#<Article id: 1, title: "Inception", created_at: "2012-11-02 06:20:46", updated_at: "2012-11-02 06:20:46">
```

Now time to see how they behave differently.

### In Rails 3.x

```ruby
article.tags
=> [#<Tag id: 1, name: "Movie", created_at: "2012-11-02 06:18:29", updated_at: "2012-11-02 06:18:29">]

article.tags.class
=> Array
```

### In Rails 4.0.0
```ruby
article.tags
=> [#<Tag id: 1, name: "Movie", created_at: "2012-11-02 06:18:29", updated_at: "2012-11-02 06:18:29">]

article.tags.class
=> ActiveRecord::Associations::CollectionProxy
```

So far nothing too different, right? Sure it's a different class but the output is the same.

Well, let's add controllers and a basic JSON API. The console is a nice sandbox but I wonder how this new CollectionProxy works in the real world.

```ruby
class TagsController < ApplicationController
  respond_to :json, :html
 
  def index
    @tags = Tag.all
  end
end
```

Nothing too fancy here, we're only responding with JSON and trusting Rails to format the output for the index action of the tags controller.

## Fetching `/tags.json`

### In Rails 3.x
```ruby
[
  {
    created_at: "2012-11-02T06:18:29-05:00",
    id: 1,
    name: "Movie",
    updated_at: "2012-11-02T06:18:29-05:00"
  }
]
```

### In Rails 4.0.0
```ruby
[
  {
    tag: {
      created_at: "2012-11-02T06:18:29-05:00",
      id: 1,
      name: "Movie",
      updated_at: "2012-11-02T06:18:29-05:00"
    }
  }
]
```

Alright, now the records being returned are surrounded by a `tag` object. Not really sure why it isn't called `tags` instead since this is supposed to be a collection of tags, but let's move on.

**Update (2013-12-29)**: Yes, that's because I'm using [active_model_serializers](https://github.com/rails-api/active_model_serializers) instead of the Rails 4 default of jbuilder. Nothing else.

```ruby
class ArticlesController < ApplicationController
  respond_to :json, :html
 
  def show
    respond_with @article = Article.find(params[:id])
  end
end
```

We built a simple show action of the articles controller.

## Fetching `/articles/1.json`

### In Rails 3.x
```ruby
{
  created_at: "2012-11-02T00:57:19Z",
  title: "Billing thing",
  id: 1,
  updated_at: "2012-11-02T05:58:10Z"
}
```

### In Rails 4.0.0
```ruby
{
  model: {
    article: {
      id: 1,
      title: "Inception",
      created_at: "2012-11-02T06:20:46-05:00",
      updated_at: "2012-11-02T06:20:46-05:00"
    }
  },
  options: { }
}
```

Holy nesting Batman! Now instead of spitting out the attributes for the single record being fetched through the GET request, ~~Rails~~ [active_model_serializers](https://github.com/rails-api/active_model_serializers) becomes a lot more specific. It reminds us that this record is a model called article and then prioritizes columns a little better. The ID makes sense at the top, then the data followed by the timestamps. I'm not certain what the options' hash is supposed to contain but at first glance this seems like a cleaner default output.

As you can see, default JSON returns in Rails 4 are ~~quite different from their Rails 3.x counterparts~~ exactly the same unless you forget that you added a completely different JSON serialization gem like [active_model_serializers](https://github.com/rails-api/active_model_serializers). The formatting is better, but this is likely to require some work on whatever consumes your JSON API, for instance in some cases I either had to rewrite the JavaScript I was using to call my app's API. In others, it made more sense (at least for now) to change this default output. Either on the fly using `map` or with JSON formatting tools like [Jbuilder](https://github.com/rails/jbuilder) or [rabl](https://github.com/nesquena/rabl).