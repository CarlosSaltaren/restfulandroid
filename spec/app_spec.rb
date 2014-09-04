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

    it 'should read the content of the file  ' do

    end
  end



  context 'web page shows greetings' do
    before :each do
    end

    it 'should read the content of the web page' do
      get '../views/index.erb'
      #expect(last_response).to be_ok
      #assert last_response.body.include?('H')
    end
  end




  #include Rack::Test::Methods
  def app
    WebPageDashBoard
  end





  it 'should load the home page' do
      get '/'
      expect(last_response).to be_truthy
  end
  it 'should show Hello to ToughtWorks' do
    get 'views/index.erb'
    p last_response.body
    expect(last_response.body.include?('454544')).to be_truthy
  end






end

