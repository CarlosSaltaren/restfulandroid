require 'rack/test'
require_relative '../lib/app.rb'


set :environment, :test


def app

    Sinatra::Application


end

describe 'Reverse Service' do
    include Rack::Test::Methods
      it 'should load the home page' do
          get '/'
          last_response.should be_ok
      end
end

#require 'rspec'

#describe 'My behaviour' do

 # it 'should do something' do

  #  true.should == false
  #end
#end