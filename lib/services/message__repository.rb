class MessageRepository
  @@message = ''
  @@date = nil

  def self.message=(msg, date)
    @@message = msg
    @@date=date

  end

  def self.message
    @@message
  end

  def self.date
    @@date
  end

end