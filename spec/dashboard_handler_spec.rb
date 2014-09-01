require 'rspec'

require_relative '../lib/dashboard_handler'

describe DashboardHandler do

  subject { DashboardHandler.new }

  context 'ping' do
    it 'returns pong' do
      expect(subject.ping).to eq 'pong'
    end
  end


  context 'If the file in the system' do
    it 'returns true or false' do
      expect(subject.isFileExist).to eq true
    end
  end


end