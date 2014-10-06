ENV['RACK_ENV'] = 'test'

require 'rspec'
require 'rspec/matchers'
require_relative '../lib/app'
require 'rack/test'
#require 'active_support/core_ext'

describe 'WebPageDashBoard' do
  include Rack::Test::Methods

  def app
    WebPageDashBoard
  end

  # Test the get message endpoing using the mock object
  describe 'URI: /dashboard' do
    describe 'GET' do
      it 'gets the message from the message handler' do
        message_handler = double(:message_handler)
        allow(message_handler).to receive(:new).and_return(message_handler)
        allow(MessageHandler).to receive(:new).and_return(message_handler)
        expect(message_handler).to receive(:get_message).and_return('something')
        get '/dashboard'
        expect(last_response.body).to eq 'something'
      end
      it 'should return a 200 OK' do
        get '/dashboard'
        expect(last_response.status).to eq(200)
      end
    end
  end


  describe 'URI: /message' do
    describe 'PUT' do
      it 'should return a 200 OK' do
        message_handler = double(:message_handler)
        allow(MessageHandler).to receive(:new).and_return(message_handler)
        expect(message_handler).to receive(:store_message).with('Hi there',Date.parse('2014-09-29'))
        post '/message', {message_text:'Hi there',expiry_date:'2014-09-29'}.to_json, {'content-type' => 'application/json'}
        expect(last_response.status).to eq(200)
      end

      it 'should return a 400 bad request wrong date' do
        message = 'hello world'
        post '/message', {message_text:message,expiry_date:'2014-15-29'}.to_json, {'content-type' => 'application/json'}
        expect(last_response.status).to eq(400)
      end

      it 'should update the message' do
        message = 'hello world'
        post '/message', {message_text:message}.to_json, {'content-type' => 'application/json'}
        get '/dashboard'
        expect(last_response.body).to eq(message)
      end

      context 'there is a message stored' do
        let(:existing_message) { "G'day" }
        before do
          put '/message', {message_text:existing_message}.to_json, {'content-type' => 'application/json'}
        end

        it 'should overwrite previous message' do
          post '/message', {message_text:'hello'}.to_json, {'content-type' => 'application/json'}
          get '/dashboard'
          expect(last_response.body).to eq('hello')
        end

        it 'should not overwrite message if post message is empty' do
          post '/message', {message_text:''}.to_json, {'content-type' => 'application/json'}
          get '/dashboard'
          expect(last_response.body).to eq 'hello'
        end

      end

    end

# new test start here

    describe 'POST' do
      it 'should return an id when I post a message' do
        #creating a mock for SecureRandom.uuid
        allow(SecureRandom).to receive(:uuid).and_return('e7832h3', 'e7w32h3', 'e7x32h3','e7b32h3')

        post '/messages', {message_text:'Hi there Thoughtworkers',expiry_date:'2014-09-29'}.to_json, {'content-type' => 'application/json'}
        expect(last_response.body).to eq('e7832h3')

        post '/messages', {message_text:'Hi Carlos',expiry_date:'2014-09-28'}.to_json, {'content-type' => 'application/json'}
        expect(last_response.body).to eq('e7w32h3')

        post '/messages', {message_text:'Hi there Martin',expiry_date:'2014-09-30'}.to_json, {'content-type' => 'application/json'}
        expect(last_response.body).to eq('e7x32h3')

        post '/messages', {message_text:'Hi there Internes',expiry_date:'2014-09-29'}.to_json, {'content-type' => 'application/json'}
        expect(last_response.body).to eq('e7b32h3')
      end
    end


    describe 'GET' do
      it 'should return a message based on given id' do
        allow(SecureRandom).to receive(:uuid).and_return('e7832h3xx') #<--- mock SecureRandom
        post '/messages', {message_text:'Hi there Thoughtworkers',expiry_date:'2014-09-29'}.to_json, {'content-type' => 'application/json'}
        get '/dashboards',{idmessage:'e7832h3xx'}.to_json, {'content-type' => 'application/json'}

        expect(last_response.body).to eq('Hi there Thoughtworkers')
      end
    end

#End of new tests

    describe 'DELETE' do
      context 'there is a message to be deleted' do
        let(:existing_message) { "G'day" }

        before do
          post '/message', {message_text:existing_message}.to_json, {'content-type' => 'application/json'}

        end

        it 'should delete a message' do
          delete '/message'
          expect(last_response.status).to eq(200)

          get '/dashboard'
          expect(last_response.body).to eq('Have a nice day')
        end
      end

      context 'there is not any message to delete' do
        before do
          MessageRepository.message = nil
        end

        it 'should return an http error' do
          delete '/message'
          expect(last_response.status).to eq(404)
          get '/dashboard'
          expect(last_response.body).to eq('Have a nice day')
        end
      end
    end
  end
end






