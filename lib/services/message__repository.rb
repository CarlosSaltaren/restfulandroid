require_relative 'message'
require 'securerandom'

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

  #Array[Message] objMessage;



  def self.add_message (message, id)
    #@messages.merge! :id =>  message
    @messages = {:id =>  message}
  end


  def self.get_number_of_message
    return @messages.length

  end



  def  self.get_message(id)

    {id:1, message:"whatever", expiry_date:Date.new(2014,9,23)}
    return message

  end


    #def self.add_message(message)

      # Add the message to the array and assign an ID somehow
      #{id:1, message:"whatever", expiry_date:Date.new(2014,9,23)}
    #end

    #def  self.get_message(id)

     # {id:1, message:"whatever", expiry_date:Date.new(2014,9,23)}
      #return message

    #end


end