require 'spec_helper'

describe IndexHelper do
  describe "#end_friend_row" do
    it "should not start a new row on the first item" do
      helper.end_friend_row(0).should == ''
      helper.end_friend_row(1).should == ''
    end
    
    it "should return an empty string if we haven't gotten to the end of a row" do
      helper.end_friend_row(3).should == ''
    end
    
    it "should return the end of a row and the beginning of a new one if we are at the end of a row" do
      helper.end_friend_row(4).should == '</tr><tr>'
    end
  end
end
