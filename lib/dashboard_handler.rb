class DashboardHandler
  def ping
    'pong'
  end


  def isFileExist (fileName)

    p fileName
    return File.file? (fileName)
#return true

  end

end