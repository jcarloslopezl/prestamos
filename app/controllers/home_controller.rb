class HomeController < ApplicationController
	before_action :set_auth

  def index
  end

  def profile
  	@user = User.find(session[:user_id])
  end

  def set_auth
    @auth = session[:omniauth] if session[:omniauth]
  end
end