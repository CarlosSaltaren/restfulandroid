class Message
  @message = ''
  @expiryDate = nil


  def self.message=(msg)
    @message = msg
  end


  def self.expiryDate=(expiry_date)
    @expiryDate=expiry_date
  end


  def self.message
    @message
  end

  def self.expiryDate
    @expiryDate
  end
end