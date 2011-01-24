require 'spec_helper'

describe FriendsHelper do
  describe "#link_to_friend" do
    it "should return the right link" do
      link = helper.link_to_friend('Joe Remus', Friend.new({'id' => 12345}, Me.new('some_token')))
      link.should == '<a href="/friends/12345">Joe Remus</a>'
    end
  end
  
  describe "#list_same_likes" do
    before do
      @me = Me.new('some_token')
      @friend = Friend.new({'id' => 12345, 'name' => 'Adam', 'picture' => 'http://www.example.com/pic.jpg'}, @me, true)
    end
    
    it "should return a list of likes in common" do
      helper.list_same_likes.should == "<ul><li>Robocop</li></ul>"
    end
    
    it "should return None if there aren't any likes in common" do
      @friend.stub!(:likes).and_return([])
      helper.list_same_likes.should == 'None'
    end
  end
  
  describe "#list_friends_likes" do
    before do
      @me = Me.new('some_token')
      @friend = Friend.new({'id' => 12345, 'name' => 'Adam', 'picture' => 'http://www.example.com/pic.jpg'}, @me, true)
    end
    it "should list the friend likes" do
      helper.list_friends_likes.should == "<ul><li>Robocop</li><li>Lost Boys</li></ul>"
    end
    
    it "should return None if there aren't any likes" do
      @friend.stub!(:likes).and_return([])
      helper.list_same_likes.should == 'None'
    end
  end
end
