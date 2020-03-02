require 'sinatra/base'

class MyApp < Sinatra::Base
  get '/' do
    'top page'
  end
end