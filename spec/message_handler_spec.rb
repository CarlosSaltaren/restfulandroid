=begin
require 'rspec'

require_relative '../lib/dashboard_handler'

describe DashboardHandler do

  subject { DashboardHandler.new }

  context 'ping' do
    it 'returns pong' do
      expect(subject.ping).to eq 'pong'
    end
  end


  context 'If the file in the system' do
    it 'returns true or false' do
      fileName='lib/dashboard_handler.rb'
      expect(subject.isFileExist fileName ).to eq true
    end
  end


  context 'If the file has the correct ext' do

    it 'return true or false' do

      fileName = 'lib/dashboard_handler.rb'
      expect(subject.hasFileCorrectExt fileName ).to eq true


    end

  end



end


require 'rspec'
require_relative '../lib/message'
require 'yaml'

describe MessagePost do

  before :each do
    @messageObj = MessagePost.new 'author','mid','heading','message','postdate'

    messages = [
        MessagePost.new('John', 'm12', 'Reports1', 'Bla bla bla bla bla bla', 12/12/2014),
        MessagePost.new('John', 'm12', 'Reports2', 'Bla bla bla bla bla bla', 12/12/2014),
        MessagePost.new('John', 'm12', 'Reports3', 'Bla bla bla bla bla bla', 12/12/2014),
        MessagePost.new('John', 'm12', 'Reports4', 'Bla bla bla bla bla bla', 12/12/2014),
    ]

    File.open 'messageList.yml', 'w' do |f|
      f.write YAML::dump messages
    end

  end


  describe 'Test Message Instances' do
    it 'should return an object of message' do
      expect(@messageObj).to be_a MessagePost
    end
    it 'should throw an expection error when given fewer variables' do
      expect(lambda {MessagePost.new 'author','mid','heading'}).to_not be_an_instance_of MessagePost
    end

    it 'should throw an expection error when given more variables' do
      expect(lambda {MessagePost 'author','mid','heading','xx','xx','xx'}).to_not be_an_instance_of MessagePost
    end

    it 'does the file have an author?' do
      expect(@messageObj.author).to  MessagePost
    end

    #YAGNI

    #Web Service
    #message_handler.get_message




  end










end
=end
