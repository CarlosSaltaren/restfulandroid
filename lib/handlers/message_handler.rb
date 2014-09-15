require_relative '../../lib/services/message__repository'
class MessageHandler

  def get_message
    MessageRepository.message.nil? ? 'Have a nice day' : MessageRepository.message
  end


  def store_message msg
    #if !msg.empty?
    if !msg.nil? && !msg.empty?
      MessageRepository.message = msg

    if  message !=  ''

      MessageRepository.message = message

    else

      MessageRepository.message

end
    end

  end

end






