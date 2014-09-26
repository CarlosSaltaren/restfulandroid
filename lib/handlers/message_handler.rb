require_relative '../../lib/services/message__repository'
require 'date'
require 'active_support/time'

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
      if !MessageRepository.date.nil? && !MessageRepository.date.empty?
        if Date.parse(MessageRepository.date.to_s) < Date.today
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
      MessageRepository.date
  end

 
  def store_message ( msg,*date )
    if !msg.nil? && !msg.empty?
      MessageRepository.message = msg
      MessageRepository.date = date
    end
  end



  def delete_message
    @status = false
    if !MessageRepository.message.nil?
      MessageRepository.message = ''
      @status = true
    end
    @status
  end
end






