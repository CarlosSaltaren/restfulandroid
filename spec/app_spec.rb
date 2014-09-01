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

<<<<<<< HEAD





# File does not exist , we have to show something
#
=======
describe 'isFileValid' do
    it 'return false if file does not exist' do
      file = 'path'
      File.file?(filenme).should eql'true'
    end
>>>>>>> 6d80c79170f4fc923a789243c6510fd9912d1b16


end

