require 'rack/test'

require_relative '../lib/app'

#set :environment, :test

describe 'WebPageDashBoard' do
  include Rack::Test::Methods

  subject { WebPageDashBoard.new }

  context 'when file exists' do
    before :each do
      # create_file
    end

    it 'should read the content of the file' do

    end
  end

  context 'file does not exist' do
    before :each do
      # ensure_file_does_not_exist
    end
  end

  #include Rack::Test::Methods
  def app
    WebPageDashBoard
  end

  it 'return false if file does not exist' do
    # filename = '../config.ru'
    # expect(subject.getFile(filename)).to be true
    # @newObj.getFile filename.should eql 'This is true'
    #@newObj.getFile filename.should eql true

    #File.exist?('../config.ru').should eql true
    #expect(@newObj.getFile filename.should eql true

    #@newObj.getFile filename.should eql 'This is true'
  end
end

#def app

 #  Sinatra::Application


#end

