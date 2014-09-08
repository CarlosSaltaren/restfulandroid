class Message

  def initialize author,message,date
    @msgRespository = MessageRepository.new

    @msgRespository.author = author
    @msgRespository.message =message
    @msgRespository.date =date

  end

  def getMessage
    return @msgRespository.message

  end

  def getAuthor
   return @msgRespository.author
  end


  def getDate
    return @msgRespository.date
  end

end






