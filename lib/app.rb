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
    MessageHandler.new.get_message
  end


  put '/message' do
    body = JSON.parse(request.body.read)
    expiry_date_message=body['expiry_date']

    if expiry_date_message.nil?
      #p 'nil is fine'
      MessageHandler.new.store_message(body['message_text'])
    else
      MessageHandler.new.store_message(body['message_text'], Date.parse(body['expiry_date']))
    end

  end

  delete '/message' do
    if !MessageHandler.new.delete_message
      status 404
    end
  end


end