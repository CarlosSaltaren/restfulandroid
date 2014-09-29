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

        it 'should not overwrite message if post message is empty' do
          put '/message', ''
          get '/dashboard'
          expect(last_response.body).to eq existing_message
        end

      end

    end
  end


    describe 'DELETE' do
      context 'there is a message to be deleted' do
        let(:existing_message) { "G'day" }

        before do
          put '/message', existing_message
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







