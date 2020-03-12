# frozen_string_literal: true

require 'recurl/version'
require 'recurl/configuration'
require 'recurl/rack'

require 'recurl/railtie' if defined?(::Rails)

# bootstrap Recurl module
module Recurl
  extend Configuration
  class Error < StandardError; end
end
