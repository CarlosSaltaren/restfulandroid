
require 'rspec'

require_relative '../lib/handlers/message_handler'

describe 'Message Repository' do

  #subject { Message.new }

  @msgObj = Message.new
  context 'setMessage and return the message' do
    it 'set the message' do

    end
      msg = 'Hi'
      @msgObj.setMessage(ms)

    end

    it 'get the message' do
      expect(@msgObj.getMessage).to eq 'Hi'
    end
end
