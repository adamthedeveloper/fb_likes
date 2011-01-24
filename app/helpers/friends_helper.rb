module FriendsHelper
  def link_to_friend(str, friend)
      link_to str, :controller => 'friends', :action => 'show', :id => friend.id
  end
  
  def list_same_likes
    same = @friend.same_likes_as_me
    list_likes(same)
  end
  
  def list_friends_likes
    list_likes(@friend.likes)
  end
end
