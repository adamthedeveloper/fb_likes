require 'spec_helper'

describe IndexController do

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should redirect_to('http://test.host/login/new')
    end
  end

end