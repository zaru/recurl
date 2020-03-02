require 'pry'
require 'logger'

class Recurl

  @@logger = Logger.new(STDOUT)

  def self.logger=(logger)
    @@logger = logger
  end

  def initialize(app)
    @app = app
  end

  def call(env)
    @env = env
    build
    @app.call env
  end

  private

  def build
    logger.info "curl #{http_method} #{headers} #{params} #{url}"
  end

  def headers
    {
      'User-Agent' => env['HTTP_USER_AGENT'],
      'Accept' => env['HTTP_ACCEPT'],
      'Cookie' => env['HTTP_COOKIE']
    }.map{|k,v| "'#{k}: #{v}'"}.join(' -H ')
  end

  def params
    body = Rack::Request.new(env).body.read
    body.empty? ? '' : "-d '#{body}'"
  end

  def url
    "'#{env['REQUEST_URI']}'"
  end

  def http_method
    "-X #{env['REQUEST_METHOD']}"
  end

  def env
    @env
  end

  def logger
    @@logger
  end
end