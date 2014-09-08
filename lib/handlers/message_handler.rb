class Message

  def initialize
    @msgRespository = MessageRepository.new
  end

  def setMessage message
    @msgRespository.setMessage message
  end

  def getMessage
    @msgRespository.getMessage
  end

end






