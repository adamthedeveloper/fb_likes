class FriendsController < ApplicationController
  def show
    @friend = Friend.new({'id' => params[:id]}, @me, true)
  end
end
