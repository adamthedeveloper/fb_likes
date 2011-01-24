require 'spec_helper'

describe MeHelper do
  describe "#list_my_likes" do
    before do
      @me = Me.new('some_token')
    end
    
    it "should return a list of my likes" do
      helper.list_my_likes.should == '<ul><li>LukeYoung Music</li><li>Zach Galifianakis</li><li>Robotech</li><li>Alameda, California</li><li>Rush Limbaugh</li><li>Phil Hendrie Show Flashback</li><li>PlayHaven</li><li>Robocop</li></ul>'
    end
    
    it "should return None if there aren't any likes" do
      @me.stub!(:likes).and_return([])
      helper.list_my_likes.should == 'None'
    end
  end
end
