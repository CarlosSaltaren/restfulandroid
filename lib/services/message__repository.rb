require_relative 'message'

class MessageRepository


  @@messageshash = Hash.new

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




  def add_message (message , id)

    @@messageshash[id] = message

  end


  def get_number_of_message
    return @@messageshash.length
  end

  def  get_messagesid(id)

    return @@messageshash[id]

  end

  def  get_messages

    return @@messageshash

  end

  def  delete_messages(id)
     if @@messageshash.has_key?(id)
        @@messageshash.delete(id)
       return true
     else
       return false
    end
  end



end