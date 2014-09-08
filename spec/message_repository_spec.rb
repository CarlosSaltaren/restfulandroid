require 'rspec'
require 'rspec/matchers'

require_relative '../lib/services/message_repository'

describe MessageRepository do

  describe 'message' do
    it 'stores and retrieves a message' do
      MessageRepository.message = 'some message'
      expect(MessageRepository.message).to eq 'some messge'
    end
  end
end