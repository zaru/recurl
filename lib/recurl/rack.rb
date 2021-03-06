# frozen_string_literal: true

module Recurl
  module Rack
    # Rack middleware
    class Middleware
      attr_reader :env

      def initialize(app)
        @app = app
      end

      def call(env)
        @env = env
        log
        @app.call env
      end

      private

      def log
        logger.info "curl #{http_method} #{headers} #{params} #{url}"
        ::Rack::Request.new(env).body.rewind
      end

      def headers
        {
          'User-Agent' => env['HTTP_USER_AGENT'],
          'Accept' => env['HTTP_ACCEPT'],
          'Cookie' => env['HTTP_COOKIE'],
          'Content-Type' => env['CONTENT_TYPE']
        }.map { |k, v| " -H '#{k}: #{v}'" }.join(' ')
      end

      def params
        body = ::Rack::Request.new(env).body.read
        body.empty? ? '' : "-d '#{body}'"
      end

      def url
        "'#{env['REQUEST_URI']}'"
      end

      def http_method
        "-X #{env['REQUEST_METHOD']}"
      end

      def logger
        ::Recurl.logger
      end
    end
  end
end
