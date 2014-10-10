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
  end

  get '/dashboards' do #getting only one message with a specific id
    id = request['idmessage']
    messageStructure = MessageHandler.new.get_messagesid(id)
    body ({message_text: messageStructure.message, expiry_date: messageStructure.expiryDate}.to_json)
  end

  get '/messages' do #getting all the messages
    messageStructure = MessageHandler.new.get_messages
    array_of_messages = Array.new
    messageStructure.each do |key, value|
      message_hash = Hash.new
      message_hash = {:message => value.message, :id =>key , :expirydate => value.expiryDate }
      array_of_messages << message_hash
    end
    body (array_of_messages.to_json)

  end


  post '/message' do #deprecate method to post messages
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
    else
      expire_date = Date.parse(expiry_date_message) rescue nil
      if expire_date
        @message_id = MessageHandler.new.add_message(request_body['message_text'], Date.parse(request_body['expiry_date']))
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