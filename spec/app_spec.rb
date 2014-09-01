require 'rack/test'
require '../lib/app.rb'


set :environment, :test


def app

   Sinatra::Application


end

describe 'Reverse1 Service' do
    include Rack::Test::Methods
      it 'should load the home page' do
          get '/'
          #expect (response).to  be_success
          expect(last_response).to be_ok
      end
end






# File does not exist , we have to show something
#

#require 'rspec'

#describe 'My behaviour' do

 # it 'should do something' do

  #  true.should == false
  #end
#end