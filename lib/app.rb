require 'rubygems'
require 'sinatra'

require_relative 'dashboard_handler'

set :port, 8080

class WebPageDashBoard < Sinatra::Application

  def initialize
    @handler = DashboardHandler.new
  end

  attr_accessor :param

  get '/' do
    @handler.show_message
  end

  get '/ping' do
    @handler.ping
  end

  def reverse (string)
    string.each_char.to_a.reverse.join
  end

  def getFile filename
   #@param = filename
    File.file? filename
  end

  def giveMefile
    return @param
  end



end