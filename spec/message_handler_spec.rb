require 'rspec'
require 'rspec/matchers'
require_relative '../lib/handlers/message_handler'
require_relative '../lib/services/message__repository'
require 'date'

describe MessageHandler do


  subject { MessageHandler.new }


  describe 'get_message' do
    context 'Message exist' do
      before do
        MessageRepository.message = 'whatever'
      end
      it 'gets the message from the repo' do
        expect(MessageRepository.message).to eq 'whatever'
      end
    end

    context 'Message is nil' do
      before do
        MessageRepository.message = nil
      end
      it 'returns a default message when the message is nil' do
        expect(subject.get_message).to eq 'Have a nice day'
      end
    end

    context 'Message is empty' do
      before do
        MessageRepository.message = ''
      end
      it 'returns a default message when the message is empty' do
        expect(subject.get_message).to eq 'Have a nice day'
      end
    end
  end

  describe 'store_message' do
    context 'No message is already stored' do
      before do
        MessageRepository.message = ''
      end
      it 'returns the new message stored' do
        subject.store_message 'Message stored good morning', Date.today
        expect(MessageRepository.message).to eq 'Message stored good morning'
      end
      it 'returns the new message stored with special characters' do
        subject.store_message 'Message !@#$%^&*(*(', Date.today
        expect(MessageRepository.message).to eq 'Message !@#$%^&*(*('
      end
    end

    context 'There is a new message to be stored' do
      before do
        subject.store_message  'Message stored good morning', Date.today
      end
      it 'returns the last message stored' do
        subject.store_message  'New Message overwrite', Date.today
        expect(MessageRepository.message).to eq 'New Message overwrite'
      end
      it 'returns the previous message stored   when you post an empty message' do
        subject.store_message '', Date.today
        expect(MessageRepository.message).to eq 'Message stored good morning'
      end
    end


    context 'When you post an nil message' do
      it 'returns the previous message stored' do
        subject.store_message 'Hello am the previous message', Date.today
        subject.store_message  nil, Date.today
        expect(subject.get_message).to eq 'Hello am the previous message'
      end
    end


    context 'message set with date' do
      before do
        @dateMessage = Date.today
      end
      it 'returns the date of the message' do
        subject.store_message  'Hi there' , @dateMessage
        expect(Date.parse(subject.get_date_message.to_s)).to be == Date.today
      end
      it 'returns the date and the message' do
        dt = @dateMessage + 5
        date = dt.strftime("%Y-%m-%d")
        subject.store_message  'Hi there' ,date

        currDate = @dateMessage
        toDay = currDate.strftime("%Y-%m-%d")
        expect(Date.parse(subject.get_date_message.to_s)).to be > Date.today
      end
      it 'returns default message if message date is expired' do
        olddatemsg = @dateMessage - 5

        subject.store_message  'Hi message expired' ,olddatemsg

        expect(subject.get_message).to eq 'Have a nice day'
      end

    end

    context 'there are more than one message to be stored' do
      before do
        @dateMessage = Date.today
      end
      it 'returns all the messages that we have' do
        subject.add_message  'Hi there message one'
        subject.add_message  'Hi there message one' , @dateMessage
        subject.add_message  'Hi there message two' , @dateMessage -1000
        expect(subject.get_number_of_message).equal?  3
      end

    end



    it 'throws error when date not given' do
      expect { subject.store_message('whatever', nil) }.to raise_error
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





end
