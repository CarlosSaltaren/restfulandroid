require 'rspec'

require_relative '../lib/dashboard_handler'

describe DashboardHandler do

  subject { DashboardHandler.new }

  context 'ping' do
    it 'returns pong' do
      expect(subject.ping).to eq 'pong'
    end
  end

end