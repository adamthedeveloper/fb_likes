require 'spec_helper'

describe Like do
  describe "#initialize" do
    before(:each) do
      @like = Like.new({'name' => 'my like', 'category' => 'Like Its', 'id' => 12345})
    end
    
    it "should set the instance vars correctly" do
      @like.name.should == 'my like'
      @like.category.should == 'Like Its'
      @like.id.should == 12345
    end
  end
end
