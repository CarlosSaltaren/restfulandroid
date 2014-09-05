require 'rspec'
require_relative '../lib/message'

describe MessagePost do

  before :each do
    @messageObj = MessagePost.new 'author','mid','heading','message','postdate'
  end


  describe '#new' do
    it 'should return an object of message' do
      expect(@messageObj).to be_a MessagePost
    end
#    it 'should throw an expection error' do
 #    expect(lambda {MessagePost.new 'author','mid','heading'}).
  #   expect(subject.isFileExist fileName ).to eq true
   #end
  end
end