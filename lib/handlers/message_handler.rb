require_relative '../../lib/services/message__repository'
class MessageHandler

  def get_message
    if MessageRepository.message.nil? || MessageRepository.message.empty?
      'Have a nice day'
    else
      MessageRepository.message
    end
  end


  def store_message msg
    if !msg.nil? && !msg.empty?
      MessageRepository.message = msg

    end

  end

end






