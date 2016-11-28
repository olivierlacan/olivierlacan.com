---
title: Extracting API test code with RSpec Shared Examples
layout: post
date: '2016-08-30 15:56:00'
location: Val Morin, Québec, Canada
categories: development
draft: true
---

I've been using RSpec for about six years now. I don't dislike Test Unit or 
MiniTest, but I simply never gave them a proper chance. This is not about 
trying to convince you to use RSpec if you don't. This is about finding bliss 
when writing basic coverage for API endpoints.

I designed the Code School API endpoints we use for our iOS app about two years 
ago. I think this was the most extensive API I've ever designed and I drew a lot 
of inspiration from my favorite REST-like APIs: Stripe, GitHub. 

At the time, I decided that it would be valuable to for me to assert that we 
included certain keys and values within the responses. I can understand 
arguments against the necessity of specifying something as basic as the keys 
being returned. However, since our iOS app could not function unless we could 
guarantee that it could receive specific attributes from the API, I found 
copious motivation in doing so to avoid losing any sleep. For example if 
someone (me) decided to remove attributes from an API endpoint that didn't 
appear used. The idea of someone removing attributes from an API endpoint may 
sound insane (because it is) but we originally didn't version our endpoints so 
it *could* have happened.

Anyway, I wanted to test keys and values being returned from each of our API 
endpoints. This is around the same time that I discovered RSpec beautiful 
enhancement of the `Hash#include?` method in its `include` matcher. I was so 
enamored with it that I decided to [propose that `Hash#include?` should work 
more like RSpec's `include`][proposal] and eventually [Hash comparison operators 
were introduced in Ruby 2.3][hash-compare]. My API endpoint request specs 
ended up littered with stuff like this: 

```ruby
expected_keys = [ :id, :email, :twitter_name, :username, :name ]
expect(parsed_body["user"].keys).to include(*expected_keys)
```

And this: 
```ruby
expected_values = [
  course.id, course.title, course.state, course.position,
  course.short_description, course.long_description
]
expect(parsed_body.first.values).to include(*expected_values)
``` 

Eventually things got a little fancier:

```ruby
expected_keys = %w[
  id
  email
  twitter_name
  username
  name
]

expect(parsed_body["user"].keys).to include(*expected_keys)
```

```ruby
expected_values = %w[
  course.id
  course.title
  course.state 
  course.position
  course.short_description
  course.long_description
]

expect(parsed_body.first.values).to include(*expected_values)
```


[proposal]: http://olivierlacan.com/posts/proposal-for-a-better-ruby-hash-include/
[hash-compare]: http://olivierlacan.com/posts/hash-comparison-in-ruby-2-3/
