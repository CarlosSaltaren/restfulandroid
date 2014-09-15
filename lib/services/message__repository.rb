class MessageRepository
  @@message = ''

  def self.message=(msg)
    @@message = msg
  end

  def self.message
    @@message
  end

  


end