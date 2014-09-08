
require 'rspec'

require_relative '../lib/handlers/message_handler'

require_relative '../lib/services/message_repositories'


describe 'Message Repository' do


  msgObj = MessageRepository.new
  subject { Message.new(msgObj)}
  context 'setMessage and return the message' do
    it 'set the message' do
     msg = 'Hi'
     subject.setMessage1(msg)
   end



    it 'get the message' do
      expect(subject.getMessage1).to eq 'Hi'
    end

  end
end
