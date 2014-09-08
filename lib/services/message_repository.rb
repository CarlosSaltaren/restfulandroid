class MessageRepository
  @@message = 'afghbaeflghaeigapi'

  def self.message=(msg)
    @@message = msg
  end

  def self.message
    @@message
  end

end