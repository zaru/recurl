# Recurl

[![Code Climate](https://codeclimate.com/github/zaru/recurl/badges/gpa.svg)](https://codeclimate.com/github/zaru/recurl)
[![Test Coverage](https://codeclimate.com/github/zaru/recurl/badges/coverage.svg)](https://codeclimate.com/github/zaru/recurl/coverage)
[![Build Status](https://travis-ci.org/zaru/recurl.svg?branch=master)](https://travis-ci.org/zaru/recurl)
[![Gem Version](https://badge.fury.io/rb/recurl.svg)](https://badge.fury.io/rb/recurl)

Logger that reproduces access log with `curl` command.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'recurl'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install recurl

## Configuration

### Sinatra

```
require 'rack'
require 'recurl'
require 'logger'

Recurl.configure do |config|
  config.logger = Logger.new(STDOUT)
end
use Recurl::Rack::Middleware

require File.expand_path 'app', File.dirname(__FILE__)
run MyApp
```

### Ruby on Rails

This is an example that you might put into a Rails initializer at `config/initializers/recurl.rb`:

```
Recurl.configure do |config|
  config.logger = Logger.new(STDOUT)
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/zaru/recurl.
