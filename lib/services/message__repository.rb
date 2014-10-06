require_relative 'message'

class MessageRepository


  @messages = Hash.new

  @@message = ''
  @@expiryDate = nil

  def self.message=(msg)
    @@message = msg
  end


  def self.expiryDate=(expiry_date)
    @@expiryDate=expiry_date
  end


  def self.message
    @@message
  end

  def self.expiryDate
    @@expiryDate
  end



  def self.add_message (message , id)
    @messages={:id => message}

  end


  def self.get_number_of_message
    return @messages.length
  end

  def  self.get_message_by_index(id)
    return  @messages[id]
  end


  def  self.get_message(id)
   {id:1, message:"whatever", expiry_date:Date.new(2014,9,23)}
    return message
  end

  #test bit
  def  self.get_messages(id)
    return @messages[:id]
  end

end