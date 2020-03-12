# frozen_string_literal: true

require 'helper'

describe Recurl do
  include TestApplicationHelper
  include Rack::Test::Methods

  let(:test_app) { TestApplicationHelper::TestApplication.new }
  let(:app)      { Recurl::Rack::Middleware.new(test_app) }

  describe 'Recurl logger' do
    it 'include POST method' do
      expect(Recurl.logger).to receive(:info).with(/\-X POST/)
      post '/'
    end

    it 'include PUT method' do
      expect(Recurl.logger).to receive(:info).with(/\-X PUT/)
      put '/'
    end

    it 'include PATCH method' do
      expect(Recurl.logger).to receive(:info).with(/\-X PATCH/)
      patch '/'
    end

    it 'include DELETE method' do
      expect(Recurl.logger).to receive(:info).with(/\-X DELETE/)
      delete '/'
    end
  end
end
