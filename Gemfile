# A sample Gemfile
source "https://rubygems.org"

ruby File.read(".ruby-version").strip

gem "rake"
gem "redcarpet"
gem "albino"
gem "jekyll", "~> 3.9.0"
gem "pry" # weirdly required by jekyll, guess they don't know about gemspecs...
gem "rubypants"
gem "coffee-script"
gem "sassc"
gem "pygments.rb"
gem "kramdown-parser-gfm" # apparently required now

group :jekyll_plugins do
  # gem 'jekyll-admin'
  gem "jekyll-gist"
  gem "jekyll-redirect-from"
  gem "jekyll-haml-markup"
end

group :development do
  gem "webrick"
  gem "standard"
  gem "ruby-lsp", require: false
end
