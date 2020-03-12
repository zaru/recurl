# frozen_string_literal: true

module TestApplicationHelper
  extend self # rubocop:disable Style/ModuleFunction

  class TestApplication
    def call(_env)
      code   = 200
      body   = ['test body']
      header = { 'Content-Type' => 'text/html;charset=utf-8',
                 'Content-Length' => '9',
                 'X-XSS-Protection' => '1; mode=block',
                 'X-Content-Type-Options' => 'nosniff',
                 'X-Frame-Options' => 'SAMEORIGIN' }
      [code, header, body]
    end
  end
end
