class MessageRepository
  @@message = Ni

  def self.message=(msg)
    @@message = msg
  end

  def self.message
    @@message
  end

end