require 'spec_helper'

describe FbConnection do
  before(:each) do
    @config = YAML::load_file(Rails.root.join('config','facebook.yml'))[Rails.env]
    @oauth = Koala::Facebook::OAuth.new(@config['app_id'], @config['secret_key'], @config['url'])
    
    class FbConnection
      attr_accessor :like_list
    end
      
    @conn = FbConnection.new(@oauth.get_app_access_token)
  end

  describe "#initialize" do
    it "should set the oauth_access_token as an instance variable" do
      @conn.instance_variable_get('@oauth_access_token').should == @oauth.get_app_access_token
    end
  end

  describe "#graph" do
    it "should set the instance variable @graph if it hasn't already been set" do
      @conn.instance_variable_get('@graph').should be_nil
      @conn.graph.class.should == Koala::Facebook::GraphAPI
      @conn.instance_variable_get('@graph').should == @conn.graph
    end
  end

  describe "#likes" do
    it "should return an array of Like objects" do
      
      @conn.like_list = [
        {'name' => 'some like', 'id' => 937482, 'category' => 'Some Category'},
        {'name' => 'some other like', 'id' => 23456, 'category' => 'Another Category'},
        {'name' => 'another like', 'id' => 34512, 'category' => 'Yet Some Other Category'}
      ]
      
      @conn.likes[0].name.should == 'some like'
      @conn.likes[0].id.should == 937482
      @conn.likes[1].category.should == 'Another Category'
      @conn.likes[2].id.should == 34512
    end
  end
  
end
