require 'rack'
require 'recurl'
require 'logger'

Recurl.configure do |config|
  config.logger = Logger.new(STDOUT)
end
use Recurl::Rack::Middleware

require File.expand_path 'app', File.dirname(__FILE__)
run MyApp
