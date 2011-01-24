module MeHelper
  def list_my_likes
    list_likes(@me.likes)
  end
end