require 'rspec'
require 'rspec/matchers'
require_relative '../lib/handlers/message_handler'
require_relative '../lib/services/message__repository'

describe WebPageDashBoard do


  subject { MessageHandler.new }


  describe 'get_message' do
    context 'a message exists' do
      it 'gets the message from the repo' do
        MessageRepository.message = 'whatever'

        expect(subject.get_message).to eq 'whatever'
      end

      it 'gets the message from the repo' do
        MessageRepository.message = 'second test'

        expect(subject.get_message).to eq 'second test'
      end
    end

    context 'no message exists' do
      it 'if message is nil' do
        MessageRepository.message = nil
        expect(MessageRepository.message).to eq nil
      end

      it 'if message is empty' do
        MessageRepository.message=''
        expect(subject.get_message).to eq 'Have a nice day'
      end

    end


  end

end