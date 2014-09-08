require_relative '../../lib/services/message_repositories'
class MessageHandler

  def get_message
    MessageRepository.message
  end
end






