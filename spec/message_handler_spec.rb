require 'rspec'
require 'rspec/matchers'
require_relative '../lib/handlers/message_handler'
require_relative '../lib/services/message__repository'
require 'active_support/time'

describe MessageHandler do


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


    context 'no message exist' do
      it 'returns a default message when the message is nil' do
        MessageRepository.message = nil

        expect(subject.get_message).to eq 'Have a nice day'
      end

      it 'returns a default message when the message is empty' do
        MessageRepository.message = ''
        expect(subject.get_message).to eq 'Have a nice day'
      end

    end


end



  describe 'set_message' do
    context 'no any message stored' do
      it 'returns the new message stored' do

        subject.store_message  'Message stored good morning'
        expect(subject.get_message).to eq 'Message stored good morning'

      end
    end

    context 'There is a new message to be stored' do
      it 'returns the last message stored' do

        subject.store_message  'Message stored good morning'
        subject.store_message  'New Message overwrite'

        expect(subject.get_message).to eq 'New Message overwrite'

      end
    end

    context 'Whe you post an empty message' do
      it 'returns the previous message stored' do

        subject.store_message 'Hello new world'

        subject.store_message ''

        expect(subject.get_message).to eq 'Hello new world'
      end
    end

    context 'Whe you post an nil message' do
      it 'returns the previous message stored' do

        subject.store_message 'Hello am the previous message'

        subject.store_message  nil

        expect(subject.get_message).to eq 'Hello am the previous message'
      end
    end
  end

  describe 'Delete message' do
    let(:stored_message) { 'Have a nice day' }

    context 'Given there is a stored message' do
      it 'should delete the message' do

        MessageRepository.message = nil
        expect(subject.get_message).to eq stored_message

      end
    end

    context 'When there is no message stored' do
      it 'should not throw an error' do
        MessageRepository.message = ''
        expect(subject.get_message).to eq stored_message

      end
    end


  end



  describe 'set_date_message' do
    context 'message set with date' do
      it 'returns the date and the message' do


        d = Date.today
        p d + 5

        subject.store_message  'Hi there' ,Date.today

        expect(subject.get_date_message).to eq Date.today

      end
    end


  end



end
