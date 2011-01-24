class FbConnection
  def initialize(oauth_access_token)
    @oauth_access_token = oauth_access_token
  end
  
  def graph
    @graph ||= Koala::Facebook::GraphAPI.new(@oauth_access_token)
  end
  
  def likes
    return nil if @like_list.nil?
    @likes ||= @like_list.collect { |like| Like.new(like) }
  end
end
