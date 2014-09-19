require_relative '../../lib/services/message__repository'
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
      MessageRepository.message
    end
  end

 
  def store_message msg, date
    if !msg.nil? && !msg.empty?
      MessageRepository.message = msg

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






