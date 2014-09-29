require_relative '../../lib/services/message__repository'
require 'date'
#require 'active_support/time'

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

 
  def store_message ( msg, date, expPeriod)
    raise RuntimeError if date.nil?
    if !msg.nil? && !msg.empty?
      MessageRepository.message = msg
      MessageRepository.expiryDate = date
    end
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


  def auto_msg_expiry
    if get_date_message < Date.today
       delete_message
    end
  end
end






