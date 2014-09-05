require 'rspec'
require_relative '../lib/message'

describe MessagePost do

  subject {  MessagePost.new 'author','mid','heading','message','postdate'}

  before :each do
    end


  describe '#new' do
    it 'should return an object of message' do
      expect(subject).to be_a MessagePost
    end
 #   it 'should throw an expection error' do
  #   expect(lambda {MessagePost.new 'author','mid','heading'}).
  #   expect(subject.isFileExist fileName ).to eq true
   #end
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