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
      expect(lambda {MessagePost.new 'author','mid','heading','xx','xx','xx'}).to_not be_an_instance_of MessagePost
    end

  end
end