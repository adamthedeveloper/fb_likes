require 'spec_helper'

describe Me do
  describe "#initialize" do
    context "Exceptions" do
      it "should raise an exception if there is no access_token passed to it" do
        lambda {Me.new(nil)}.should raise_error(StandardError, "No access token supplied")
      end
    end 
  end
  
  describe "#profile" do
    before(:all) do
      @me = Me.new('some_token')
    end
    
    it "should set the @profile instance variable" do
      @me.instance_variable_get('@profile').should be_nil
      @me.profile.should == {"name"=>"Mooley", "id"=>"12345", "likes"=>{"data"=>[{"name"=>"Robocop", "category"=>"80s Movies", "id"=>"1234556"}, {"name"=>"Lost Boys", "category"=>"80s Movies", "id"=>"1234557"}]}, "picture"=>"http://www.google.com/images/nav_logo29.png"}
      @me.instance_variable_get('@profile').should == {"name"=>"Mooley", "id"=>"12345", "likes"=>{"data"=>[{"name"=>"Robocop", "category"=>"80s Movies", "id"=>"1234556"}, {"name"=>"Lost Boys", "category"=>"80s Movies", "id"=>"1234557"}]}, "picture"=>"http://www.google.com/images/nav_logo29.png"}
    end
  end
  
  describe "#friends" do
    before(:all) do
      @me = Me.new('some_token')
    end
    it "should set the @friends instance variable with Friend objects" do
      @me.instance_variable_get('@friends').should be_nil
      @me.friends.first.name.should == 'Steve Wood'
      @me.instance_variable_get('@friends').should_not be_nil
      @me.friends.last.picture.should == 'http://profile.ak.fbcdn.net/hprofile-ak-snc4/hs1324.snc4/161509_526869583_1072082_q.jpg'
    end
  end
end
