require 'rubygems'
require 'sinatra'
#require 'rails_helper'
require_relative '../lib/handlers/message_handler'
require 'json'
require 'uri'
require 'cgi'

class WebPageDashBoard < Sinatra::Application

  attr_accessor :param

  get '/dashboard' do
<<<<<<< HEAD
    body(MessageHandler.new.get_message)
    # request_body = JSON.parse(request.body.read)
    # body(MessageHandler.new.get_message(request_body['msgid'])) # <-- This is the response body
=======
    # MessageHandler.new.get_message()
    #request_body = JSON.parse(request.body.read)
    body(MessageHandler.new.get_message) # <-- This is the response body
>>>>>>> a1faf613ef835bad26f0069f2cabc2824b043a8f
  end

  get '/junk' do
    status 200
    body ["Hello"].to_json
  end

  post '/message' do
    request_body = JSON.parse(request.body.read)
    expiry_date_message=request_body['expiry_date']
    if expiry_date_message.nil?
      MessageHandler.new.store_message(request_body['message_text'])
    else
      d = Date.parse(expiry_date_message) rescue nil
      if d
        MessageHandler.new.store_message(request_body['message_text'], Date.parse(request_body['expiry_date']))
        p response.body
      else
        status 400
      end
    end
  end



  post '/newmessages' do
    @message_id
    request_body = JSON.parse(request.body.read)
    expiry_date_message=request_body['expiry_date']
    if expiry_date_message.nil?
      @message_id = MessageHandler.new.add_message(request_body['message_text'])
      return @message_id
    else
      d = Date.parse(expiry_date_message) rescue nil
      if d
        @message_id = MessageHandler.new.add_message(request_body['message_text'], Date.parse(request_body['expiry_date']))
        #body(idmessage: id).to_json
        return @message_id
      else
        status 400
      end
    end
  end





  delete '/message' do
    if !MessageHandler.new.delete_message
      status 404
    end
  end



end