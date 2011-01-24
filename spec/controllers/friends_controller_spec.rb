require 'spec_helper'

describe FriendsController do
  render_views
  
  def friend
    {
        'name' => 'Mooley', 
        'picture' => 'http://www.google.com/images/nav_logo29.png', 
        'id' => "12345", 
        'likes' => {
          'data' => [
        {'name' => 'Robocop', 'category' => '80s Movies', 'id' => "1234556"},
        {'name' => 'Lost Boys', 'category' => '80s Movies', 'id' => "1234557"}
        ]
      }
    }
  end
  describe "GET 'show'" do
    before do
      me = Me.new('some_token')
      Me.should_receive(:new).and_return(me)
      mock_friend = Friend.new(friend,me,false)
      Friend.should_receive(:new).and_return(mock_friend)
    end
    it "should be successful" do
      get 'show', :id => '12345'
      response.body.should =~ /<b>Likes in common with me:<\/b>/
      response.body.should =~ /<ul><li>Robocop<\/li><\/ul>/
    end
  end

end