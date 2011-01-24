class Friend < FbConnection
  attr_reader :name, :id, :picture, :me
  
  def initialize(friend, me, fetch = false)
    @me = me
    @graph = @me.graph
    @id = friend['id']
    
    if fetch && !@id.nil?
      friend = @graph.get_object(@id,{:fields => ['name','picture','likes']})
    end
    
    @name = friend['name']
    @picture = friend['picture']
    @like_list = friend['likes']['data'] if friend['likes']
  end
  
  def same_likes_as_me
    @me.likes.collect { |my_like| my_like if likes.collect(&:id).include?(my_like.id) }.compact
  end
  
end
