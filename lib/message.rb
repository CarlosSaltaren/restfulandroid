class MessagePost
attr_accessor :author, :messageId, :heading, :message, :postdate
  def initialize(author, messageId, heading, message, postdate)
    @author = author
    @messageId = messageId
    @heading = heading
    @message = message
    @postDate = postdate
  end


end