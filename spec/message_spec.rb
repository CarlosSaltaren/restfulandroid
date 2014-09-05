require 'rspec'
require_relative '../lib/message'

describe MessagePost do

  before :each do
    @messageObj = MessagePost.new 'author','mid','heading','message','postdate'
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