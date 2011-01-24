class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :build_me
  
  def oauth
    @oauth ||= Koala::Facebook::OAuth.new
  end
  
  def oauth_access_token
    oauth.get_app_access_token
  end
  
  def user_info
    @user_info ||= oauth.get_user_info_from_cookie(cookies)
  end
  
  def user_id
    @user_id ||= oauth.get_user_from_cookies(cookies)
  end
  
  def user_access_token
    return nil unless user_info
    user_info['access_token']
  end
  
  def facebook_config
    @facebook_config ||= YAML::load_file(Rails.root.join('config','facebook.yml'))[Rails.env]
  end
  
  def build_me
    begin
      @me ||= Me.new(user_access_token)
    rescue => e
      @me = nil
    end
  end
end
