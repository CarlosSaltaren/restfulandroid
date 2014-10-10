class Message
  @message = ''
  @expiryDate = nil
  @id = nil



  def initialize msg,date
    @message = msg
    @expiryDate = date

  end


  def message=(msg)
    @message = msg
  end


  def expiryDate=(expiry_date)
    @expiryDate=expiry_date
  end

  def id=(id)
    @id=id
  end


  def message
    @message
  end

  def expiryDate
    @expiryDate
  end

  def id
    @id
  end

end