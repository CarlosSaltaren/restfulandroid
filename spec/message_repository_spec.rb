require 'rspec'

require_relative '../lib/services/message_repositories'

describe 'Message Repository' do

  subject { MessageRepository.new }


  context 'setMessage and return the message' do
    it 'set the message' do
      msg = 'Hi'
      subject.setMessage(msg)
    end

    it 'get the message' do
      msg = 'Hi'
      subject.setMessage(msg)
      expect(subject.getMessage).to eq 'Hi'
    end
  end
end