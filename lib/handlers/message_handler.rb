require_relative '../../lib/services/message_repository'
class MessageHandler

  def get_message
    MessageRepository.message
  end
end






