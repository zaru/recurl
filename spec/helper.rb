# frozen_string_literal: true

require 'rspec'
require 'rack/test'
require 'logger'
require 'support/test_application_helper'
require 'recurl'
require 'simplecov'
SimpleCov.start

Recurl.configure do |config|
  config.logger = Logger.new(STDOUT)
end
