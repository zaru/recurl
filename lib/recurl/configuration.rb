module Recurl
  module Configuration
    attr_accessor :logger

    def configure
      yield self
    end
  end
end