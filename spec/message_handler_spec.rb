require 'rspec'
require 'rspec/matchers'
require_relative '../lib/handlers/message_handler'
require_relative '../lib/services/message_repository'

describe MessageHandler do

  subject { MessageHandler.new }

  describe 'get_message' do
    it 'gets the message from the repo' do
      MessageRepository.message = 'whatever'

      expect(subject.get_message).to eq 'whatever'
      end

    it 'gets the message from the repo' do
      MessageRepository.message = 'second test'

      expect(subject.get_message).to eq 'second test'
    end

  end

end
