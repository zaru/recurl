# frozen_string_literal: true

module Recurl
  # Load middleware when use Rails
  class Railtie < ::Rails::Railtie
    initializer 'recurl.middleware' do |app|
      app.middleware.use(Recurl::Rack::Middleware)
    end
  end
end
