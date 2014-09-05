class DashboardHandler
  def ping
    'pong'
  end


  def isFileExist (fileName)

    p fileName
    return File.file? (fileName)
#return true

  end


  def hasFileCorrectExt (fileName)

    isCorrectExt=false

    extName=File.extname(fileName)

    if(extName=='.rb')
      isCorrectExt=true
    end

    return isCorrectExt


  end



end