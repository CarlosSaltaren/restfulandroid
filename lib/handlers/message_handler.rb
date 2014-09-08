class Message

  def initialize rptObj
    @msgRespository = rptObj
  end

  def setMessage1 message
    @msgRespository.setMessage message
  end

  def getMessage1
   # return 'Hi'
    @msgRespository.getMessage
  end

end






