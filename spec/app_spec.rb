require 'rspec'
require 'rspec/matchers'
require_relative '../lib/handlers/message_handler'
require_relative '../lib/services/message__repository'
require 'rack/test'
#set :environment, :test


describe 'WebPageDashBoard' do
  include Rack::Test::Methods

  #subject { WebPageDashBoard.new }

  context 'when file exists' do
    #before :each do
    # create_file
    #end

    it 'should read the content of the file  ' do

    end
  end
end






