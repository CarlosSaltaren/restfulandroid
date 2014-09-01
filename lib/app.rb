require 'rubygems'
require 'Sinatra'


set :port, 8080


def reverse string

  string.each_char.to_a.reverse.join

end

def getFile fileName
  File.exist?('/settings/config.ru')
end



get '/' do
  return 'Cams message'
end


def getFile strFile



end


#get '/' do
#  line_num=0
# text=File.open('msgFile.csv').read
# text.gsub!(/\r\n?/, "\n")
# text.each_line do |line|
##   print "#{line_num += 1} #{line}"
# end
#end
