class Me < FbConnection
  attr_reader :like_list
  
  def initialize(oauth_access_token)
    raise StandardError, "No access token supplied" if oauth_access_token.nil?
    super(oauth_access_token)
    @like_list = connections('likes')
  end
  
  def connections(type,options = {})
    graph.get_connections('me',type,options)
  end
  
  def profile
    @profile ||= graph.get_object('me')
  end
  
  def friends
    @friends ||= connections('friends',{:fields => ['name','id','picture']}).collect { |friend| Friend.new(friend, self) }
  end
end
