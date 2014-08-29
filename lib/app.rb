require 'rubygems'
require 'Sinatra'


set :port, 8080


def reverse string

  string.each_char.to_a.reverse.join
end


get '/' do
  return 'Cams message'
end
