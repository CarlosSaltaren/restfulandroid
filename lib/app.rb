require 'rubygems'
require 'sinatra'
#require 'rails_helper'
require_relative '../lib/handlers/message_handler'
require 'json'
require 'uri'
require 'cgi'

class WebPageDashBoard < Sinatra::Application

  get '/dashboard' do

    body(MessageHandler.new.get_message)
    # request_body = JSON.parse(request.body.read)
    # body(MessageHandler.new.get_message(request_body['msgid'])) # <-- This is the response body
  end


  #stest bit start
  get '/dashboards' do

    id = request['idmessage']
    messageStructure = MessageHandler.new.get_messages(id) # <-- This is the response body
    body ({message_text: messageStructure.message, expiry_date: messageStructure.expiryDate}.to_json)


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



  post '/messages' do
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