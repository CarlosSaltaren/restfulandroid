require_relative '../../lib/services/message__repository'
class MessageHandler

  def get_message
    if(MessageRepository.message==nil || MessageRepository.message=='' )
      return MessageRepository.message='Have a nice day'
    end
    MessageRepository.message
  end




end






