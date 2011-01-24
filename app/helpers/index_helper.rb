module IndexHelper
  def end_friend_row(friend_counter)
    raw((friend_counter != 1 && ((friend_counter+1)%5 == 0)) ? "</tr><tr>" : '')
  end
end
