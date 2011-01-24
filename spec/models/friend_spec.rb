require 'spec_helper'

describe Friend do
  before(:each) do
    @me = Me.new('some_token')
    @me.stub!(:likes).and_return([Like.new({'name' => 'Robocop', 'category' => '80s Movies', 'id' => '1234556'})])
  end
  
  describe "#initialize" do
    it "should instantiate variables - passing args and fetch=false" do
      friend = Friend.new({'name' => 'Mooley', 'picture' => 'http://www.google.com/images/nav_logo29.png', 'id' => '12345'},@me)
      friend.name.should == 'Mooley'
      friend.picture.should == 'http://www.google.com/images/nav_logo29.png'
      friend.id.should == '12345'
      friend.likes.should be_nil
    end
    
    it "should instantiate variables by fetching them from facebook fetch=true" do
      friend = Friend.new({'id' => '12345'},@me, true)
      friend.likes[0].name.should == 'Robocop'
      friend.name.should == 'Mooley'
      friend.id.should == '12345'
    end
  end
  
  describe "#same_likes_as_me" do
    it "should return an array with the Likes in it that match me and friend" do
      friend = Friend.new({'id' => '12345'},@me, true)
      friend.same_likes_as_me.first.name.should == "Robocop"
    end
  end
end
