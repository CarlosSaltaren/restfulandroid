require 'rspec'
require_relative '../lib/message'

describe MessagePost do

  subject {  MessagePost.new 'author','mid','heading','message','postdate'}

  before :each do
    end


  describe 'Test Message Instances' do
    it 'should return an object of message' do
      expect(subject).to be_a MessagePost
    end
<<<<<<< HEAD
 #   it 'should throw an expection error' do
  #   expect(lambda {MessagePost.new 'author','mid','heading'}).
  #   expect(subject.isFileExist fileName ).to eq true
   #end
=======
   it 'should throw an expection error when given fewer variables' do
     expect(lambda {MessagePost.new 'author','mid','heading'}).to_not be_an_instance_of MessagePost
   end

    it 'should throw an expection error when given more variables' do
      expect(lambda {MessagePost.new 'author','mid','heading','xx','xx','xx'}).to_not be_an_instance_of MessagePost
    end

>>>>>>> 29ec0cf0ba0690db9a69c9a856af47f67ffb7a2a
  end

  describe '#new' do
    it 'Is any author in the message' do
      expect(subject).to be_a MessagePost
    end
#    it 'should throw an expection error' do
#    expect(lambda {MessagePost.new 'author','mid','heading'}).
#   expect(subject.isFileExist fileName ).to eq true
#end
  end








end