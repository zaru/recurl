# frozen_string_literal: true

require 'recurl/version'
require 'recurl/configuration'
require 'recurl/rack'

module Recurl
  extend Configuration
  class Error < StandardError; end
  # Your code goes here...
end
