require 'sinatra'

set :port, 8080

get '/' do
  return 'My message'
end
