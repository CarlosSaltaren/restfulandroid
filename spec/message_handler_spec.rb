require 'rspec'
require_relative '../lib/handlers/message_handler'


describe 'Message Repository' do


  subject {  MessageRepository.new}

  context 'setMessage and return the message' do
    it 'set the message' do
     msg = 'Hi'
     subject.setMessage1(msg)
   end


=begin
    it 'get the message' do
      expect(subject.getMessage1).to eq 'Hi'
    end

    it 'msg has author' do

      expect(subject.getAuthor).to eq 'csal'

    end
=end
  end
end
