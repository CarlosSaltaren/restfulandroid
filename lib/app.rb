require 'rubygems'
require 'sinatra'
require_relative '../lib/handlers/message_handler'

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
    @message_handler.store_message(request.body.read)
  end

end