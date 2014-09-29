require 'rubygems'
require 'sinatra'
#require 'rails_helper'
require_relative '../lib/handlers/message_handler'
require 'json'
require 'uri'
require 'cgi'

class WebPageDashBoard < Sinatra::Application

  attr_accessor :param

  DEFAULT_CONSTANCE
  get '/dashboard' do
    MessageHandler.new.get_message
  end


  put '/message' do
    body = JSON.parse(request.body.read)
    if body['expiry_date'].nil?

    end
    raise RuntimeError if date.nil? if Date.parse()
    MessageHandler.new.store_message(body['message_text'], Date.parse(body['expiry_date']))
  end

  delete '/message' do
    if !MessageHandler.new.delete_message
      status 404
    end
  end


end