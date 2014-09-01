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

  def initialize

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



#    get '/' do

#      return 'Cams message'
#
#    end




    #get '/' do
    #  line_num=0
    # text=File.open('msgFile.csv').read
    # text.gsub!(/\r\n?/, "\n")
    # text.each_line do |line|
    ##   print "#{line_num += 1} #{line}"
    # end
    #end

end