module Recurl
  class Railtie < ::Rails::Railtie
    initializer 'recurl.middleware' do |app|
      app.middleware.use(Recurl::Rack::Middleware)
    end
  end
end