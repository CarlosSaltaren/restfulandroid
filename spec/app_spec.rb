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



describe 'isFileValid' do
    it 'return false if file does not exist' do
      file = 'path'
      File.file?(filenme).should eql'true'
    end


end

