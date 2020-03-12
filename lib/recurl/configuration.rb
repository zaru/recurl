# frozen_string_literal: true

module Recurl
  # Configure Recurl
  #
  # Usage:
  # Recurl.configure do |config|
  #   config.logger = Logger.new(STDOUT)
  # end
  module Configuration
    attr_accessor :logger

    def configure
      yield self
    end
  end
end
