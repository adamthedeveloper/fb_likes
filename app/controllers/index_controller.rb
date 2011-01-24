class IndexController < ApplicationController
  def index
    redirect_to login_new_path and return if user_access_token.nil?
    @me = Me.new(user_access_token)
  end
end
