require_relative '../../lib/services/message__repository'
require_relative '../../lib/services/message'
require 'date'
require 'securerandom'
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
      #'Have a nice day'
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
  def get_date_message
      MessageRepository.expiryDate
  end

 
  def store_message ( msg, date = Date.today + DEFAULT_PERIOD_EXPIRE )

    #p date
    #@sta = false

    raise RuntimeError if date.nil?
    if !msg.nil? && !msg.empty?
      MessageRepository.message = msg
      MessageRepository.expiryDate = date
      messageArray = {}
    end
  end



  def add_message( msg, date = Date.today + DEFAULT_PERIOD_EXPIRE)
    @new_message = Message.new  #create an instance of the method
    @new_message.message msg #write message to the instance
    @new_message.expiryDate date # write date to the instance
    @id  = secureRandom.hex(3) # generate secure rundom id for the message

    MessageRepository.add_message @new_message ,@id # store the message onbject
    return @id
    p 'am here'

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






