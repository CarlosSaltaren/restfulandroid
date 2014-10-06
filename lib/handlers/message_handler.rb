require_relative '../../lib/services/message__repository'
require_relative '../../lib/services/message'
require 'date'

#require 'active_support/time'

DEFAULT_PERIOD_EXPIRE = 5   #days


class MessageHandler


  #@output = ''



  def initialize
    @output = 'Have a nice day'
  end


  def get_message
    if MessageRepository.message.nil? || MessageRepository.message.empty?
      @output
    else
      if !MessageRepository.expiryDate.nil? && !MessageRepository.expiryDate.nil?
        if MessageRepository.expiryDate < Date.today
          @output
        else
          MessageRepository.message
        end
      else
        MessageRepository.message
      end
    end
  end

#test bit
  def get_messages(id)
    p get_number_of_message

    if get_number_of_message <= 0
      @output
    else
      MessageRepository.get_messages(id)
    end
  end
#end testing bit


  def get_date_message
      MessageRepository.expiryDate
  end


 
  def store_message ( msg, date = Date.today + DEFAULT_PERIOD_EXPIRE )
    raise RuntimeError if date.nil?
    if !msg.nil? && !msg.empty?
      MessageRepository.message = msg
      MessageRepository.expiryDate = date
    end
  end



  def add_message ( msg, date = Date.today + DEFAULT_PERIOD_EXPIRE )

    id = SecureRandom.uuid
    message = Message.new msg,date
    MessageRepository.add_message message ,id
    return id

  end

  def get_message_by_index ( id )

    return MessageRepository.get_message_by_index id

  end

  def get_number_of_message
    return MessageRepository.get_number_of_message
  end




  def delete_message
    @status = false
    if !MessageRepository.message.nil?
      MessageRepository.message = ''
      MessageRepository.expiryDate = ''
      @status = true
    end
    @status
  end

end






