class Message
  @@message = ''
  @@expiryDate = nil


  def message=(msg)
    @@message = msg
  end


  def expiryDate=(expiry_date)
    @@expiryDate=expiry_date
  end


  def message
    @@message
  end

  def expiryDate
    @@expiryDate
  end
end