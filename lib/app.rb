require 'rubygems'
require 'sinatra'

require_relative 'dashboard_handler'

set :port, 8080

class WebPageDashBoard < Sinatra::Application

  attr_accessor :param

  def initialize
    @handler = DashboardHandler.new
  end

  get '/ping' do
    @handler.ping
  end


  def getFile filename
   #@param = filename
   File.file? filename
  end

  def giveMefile
    return @param
  end


end