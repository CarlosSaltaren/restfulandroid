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



  def add_message (msg, date = Date.today + DEFAULT_PERIOD_EXPIRE)
    id = SecureRandom.hex(3)

    messageObj = Message.new msg, date
    # messageObj.message msg
    # messageObj.expiryDate date
   # p id
    MessageRepository.add_message messageObj ,id
    #p messageObj.message
    # return MessageRepository.get_number_of_message

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






