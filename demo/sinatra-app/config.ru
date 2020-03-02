require 'rack'
require 'logger'

require File.expand_path 'recurl', File.dirname(__FILE__)
Recurl.logger = Logger.new('./recurl.log')
use Recurl

require File.expand_path 'app', File.dirname(__FILE__)
run MyApp
