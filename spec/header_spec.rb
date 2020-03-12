# frozen_string_literal: true

require 'helper'

describe Recurl do
  include TestApplicationHelper
  include Rack::Test::Methods

  let(:test_app) { TestApplicationHelper::TestApplication.new }
  let(:app)      { Recurl::Rack::Middleware.new(test_app) }

  shared_examples_for 'include header' do |header|
    it do
      key = header[:key]
      val = header[:val]
      expect(Recurl.logger).to receive(:info).with(/\-H '#{key}: #{val}'/)
      header key, val
      get '/'
    end
  end

  describe 'Recurl logger' do
    it_behaves_like 'include header', { key: 'User-Agent', ua: 'dummy agent' }
    it_behaves_like 'include header', { key: 'Accept', ua: 'text/html' }
    it_behaves_like 'include header', { key: 'Cookie', ua: 'key=value' }
    it_behaves_like 'include header', { key: 'Content-Type', ua: 'text/plain' }
  end
end
