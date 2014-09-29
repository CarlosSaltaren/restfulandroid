class MessageRepository
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


  def self.add_message(message)
    # Add the message to the array and assign an ID somehow
    {id:1, message:"whatever", expiry_date:Date.new(2014,9,23)}
  end

  def self.get_message(id)
    {id:1, message:"whatever", expiry_date:Date.new(2014,9,23)}
  end
end