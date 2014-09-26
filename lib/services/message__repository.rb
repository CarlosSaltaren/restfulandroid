class MessageRepository
  @@message = ''
  @@expiryDate = nil

  def self.message=(msg)
    @@message = msg
  end


  def self.expiryDate=(xpdate)
    @@expiryDate=xpdate
  end


  def self.message
    @@message
  end

  def self.expiryDate
    @@expiryDate
  end

end