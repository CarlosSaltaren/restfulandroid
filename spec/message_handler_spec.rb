
require 'rspec'

require_relative '../lib/handlers/message_handler'

require_relative '../lib/services/message_repositories'


describe 'Message Repository' do

  before :all do
    subject { Message.new('Thoughtworks','Hi Team','20/12/2014')}
  end

  context 'setMessage and return the message' do
    it 'should return the message' do
      expect(subject.getMessage).to eq'Hi Team'
   end

    it 'get the message' do
      expect(subject.getMessage1).to eq 'Hi'
    end
  end
end
