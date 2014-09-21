class MessageRepository
  @@message = ''
  @@date = nil

  def self.message=(msg)
    @@message = msg

  end


  def self.date=(date)
    @@date=date

  end


  def self.message
    @@message
  end

  def self.date
    @@date
  end

end