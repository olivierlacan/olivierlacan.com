---
title: In Defense of Integration Tests
layout: post
draft: true
location: Val Morin, Québec, Canada
categories: development
---

Slow. Buggy. Prone to false negatives. A pain in the ass because Capybara doesn't report 500 errors. All things that I (and many others) have said about feature specs or integration tests. 

If your team hasn't seriously discussed replacing "real" browser-level integration tests with some sort of abstraction (page objects, presenters, etc.), then I sort of envy you because that must mean you haven't had as many issues as we've had.

Today, however, I'd like to focus on the value of integration tests: ensuring the functionality of a feature from an end-user's perspective. 

The latter part of that sentence is the portion I've seen developers struggle the most with. It's a little bit like creating secure software. To make it secure you have to think like a malicious hacker. But you're not a malicious hacker. You cannot possibly be as motivated as a malicious hacker so long as your incentives are not similarly aligned. 

I (sadly) don't know many developers whose incentives are aligned with their customers. This is why I believe integration tests get such a bad wrap.

If your goal is to ship a feature and move on to the next, then of course integration tests are a pain in the ass. You have to deal with headless browsers; with silently failing JavaScript code breaking your own JavaScript code; with unexpected overlays preventing your "real fake user click" from hitting the correct button. 

It's a mess. But let me show you what can happen when you avoid that mess. Imagine you have an integration with a third-party (say, GitHub) to provide an alternative means of authentication in your application.

On your sign in page, you display a "Or sign in with GitHub" link that redirects users to `/oauth/github`, which in turns redirects them to approve the authentication process on GitHub and sends them back, fully authenticated,  to your site. At some point after implementing this feature you'll realize that people often reach your sign in screen after being denied access to a specific section of your app that requires user authentication. In cases like this, it's common for you to carry a `return_to` parameter either in the GET query parameters or inside the session. 

Well, I don't know about you, but we did. And it all worked fine for a while. We had people try to visit a paid section, they were asked to sign in, chose GitHub, came back and were sent back on their way to the paid section. Near-seamless experience. Lovely.

Except like many services we decided in the past few months to stop rewritting our root path when users are authenticated. If you use something like Devise there's a route method you can use called [`authenticated`][devise-authenticated] which allows you to redefine the root route for a specific scope. Here, the scope is "we have an authenticated user". It's nifty because if you have a marketing page on your root route, you can spare authenticated users and show them a dashboard instead. 

Except rewritting URLs also makes it difficult to understand traffic analytics, because now one URL points to two vastly different resources. In your analytics, you see people jumping from the home page to a deeply nested section of the site only authenticated users should have access to. That's when you decide to stop rewritting the root route. As we did.

Suddenly, and without you noticing, people are ending up on the home page. A page that is 99.99% irrelevant to them and which you didn't design for authenticated users to see.

Wouldn't your feature specs catch that you say? Well, yes. Except I wrote them (years ago) to be a little faster and avoid manually visiting the sign in page. Instead my OAuth authentication feature spec goes straight to a URL no user would ever know to visit directly, skipping the `destination` param that stores the `return_to` path I mentioned earlier. We are "testing" the OAuth authentication process. In browser-level view context. But are we testing the feature, or its integration with (nearly) all of the components of application. No, we're not.

I understand you could simply lay the blame on me and focus on the fact that I made a mistake by taking a shortcut in my integration test. Or that I could very well have accounted for the return parameter in a more isolated spec.

Sure, but you'd be missing the point. The reason why people sign in with OAuth were being redirected to our home page had nothing to do with my lazy/efficient feature spec. It's was due to two small bugs. One in the view, was interpolating the value of the `return_to` parameter inside of a `link_to` helper:

```ruby
link_to "/auth/github?destination=#{return_to}"
```

In cases where `return_to` was `nil` — most of the time — this output: 

```html
<a href="/auth/github?destination=">Sign in with GitHub</a>
```

In our authentication callback controller action we assumed (hey, don't judge) that if the destination parameter coming back in the authentication hash was truthy, we should redirect to it. 

Quick aside: this is actually a common vulnerability vector for OAuth clients. You should always verify that the `destination` parameter is "safe". That means checking that it's either a relative path to your application root, or a URL pointing to a domain you trust. Unless I'm mistaken, the OmniAuth (as of version 1.3.1) gem still doesn't do that for you, so don't assume the `destination` parameter is trustworthy. It's relatively simple for an attacker to exploit an [XSS][xss] vulnerability in your application to sneak a malicious destination (`?destination=http://example.com`) inside of the original OAuth call and redirect people to a seamless copy of your application in order to [phish them][phishing]

[devise-authenticated]: https://github.com/plataformatec/devise/wiki/How-To:-Define-a-different-root-route-for-logged-in-out-users
[xss]: https://www.owasp.org/index.php/XSS
[phishing]: https://www.owasp.org/index.php/Phishing
