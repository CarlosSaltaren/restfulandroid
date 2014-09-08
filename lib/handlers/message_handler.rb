class Message


  @msgRespository = MessageRepository.new

  def initialize

  end

  def setMessage1 message
    @msgRespository.setMessage message
  end

  def getMessage1
   # return 'Hi'
    @msgRespository.getMessage
  end


  def getAuthor

  end







end






