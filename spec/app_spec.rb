ENV['RACK_ENV'] = 'test'

require 'rspec'
require 'rspec/matchers'
require_relative '../lib/app'
require 'rack/test'

describe 'WebPageDashBoard' do
  include Rack::Test::Methods

  def app
    WebPageDashBoard
  end

  describe 'URI: /dashboard' do
    describe 'GET' do
      it 'should return a 200 OK' do
        get '/dashboard'
        expect(last_response.status).to eq(200)
      end
    end
  end

  describe 'URI: /message' do
    describe 'PUT' do
      it 'should return a 200 OK' do
        put '/message'
        expect(last_response.status).to eq(200)
      end

      it 'should update the message' do
        message = 'hello world'
        put '/message', message
        get '/dashboard'
        expect(last_response.body).to eq(message)
      end

      context 'there is a message stored' do
        let(:existing_message) { "G'day" }

        before do
          put '/message', existing_message
        end

        it 'should overwrite previous message' do
          put '/message', 'hello'
          get '/dashboard'
          expect(last_response.body).to eq('hello')
        end
      end
    end
  end
end






