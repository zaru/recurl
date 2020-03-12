# Recurl

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

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/zaru/recurl.
