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
    MessageHandler.new.store_message(request.body.read, Date.today)



  end

  delete '/message' do
    if !MessageHandler.new.delete_message
      status 404
    end
  end


end