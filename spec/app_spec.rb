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
      begin
        message_handler = double(:message_handler)
        allow(message_handler).to receive(:new).and_return(message_handler)
        allow(MessageHandler).to receive(:new).and_return(message_handler)
        expect(message_handler).to receive(:get_message).and_return('something')
        get '/dashboard'
        expect(last_response.body).to eq 'something'
      end
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
        expect(message_handler).to receive(:store_message).with('Hi there',Date.parse('2014-09-29'))#.and_return(200)
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

    describe 'POST' do
      it 'should return an id when I post a message' do
        message_handler = double(:message_handler)
        allow(MessageHandler).to receive(:new).and_return(message_handler)
        expect(message_handler).to receive(:add_message).with('Hi there Thoughtworkers',Date.parse('2014-09-29'))#.and_return(200)
        post '/newmessages', {message_text:'Hi there Thoughtworkers',expiry_date:'2014-09-29'}.to_json, {'content-type' => 'application/json'}
        #expect(last_response.body).to eq(200)
      end



    end


  end


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







