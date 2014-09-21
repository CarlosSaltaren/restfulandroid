require 'rubygems'
require 'sinatra'
#require 'rails_helper'
require_relative '../lib/handlers/message_handler'
require 'json'
require 'uri'
require 'cgi'

class WebPageDashBoard < Sinatra::Application

  def initialize
    super
    @message_handler = MessageHandler.new
  end

  attr_accessor :param

  get '/dashboard' do
    @message_handler.get_message
  end


  put '/message' do


    #p request.body.read
    #data=CGI.parse(URI.parse(request.body.read).query)
    #p data[0]

     # p parsed_body['msg']
      @message_handler.store_message(request.body.read)



  end

  delete '/message' do
    if !@message_handler.delete_message
      status 404
    end
  end


end