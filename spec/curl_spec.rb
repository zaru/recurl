# frozen_string_literal: true

require 'helper'

describe Recurl do
  include TestApplicationHelper
  include Rack::Test::Methods

  let(:test_app) { TestApplicationHelper::TestApplication.new }
  let(:app)      { Recurl::Rack::Middleware.new(test_app) }

  describe 'Recurl logger' do
    it 'start with curl' do
      expect(Recurl.logger).to receive(:info).with(/\Acurl/)
      get '/'
    end

    it 'end with url' do
      url = 'http://example.com/dummy_url'
      expect(Recurl.logger).to receive(:info).with(/'#{url}'\z/)
      get '/', nil, { 'REQUEST_URI' => url }
    end
  end
end
