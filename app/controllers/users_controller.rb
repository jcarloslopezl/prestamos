class UsersController < ApplicationController
	
  def index
  end

  def profile
  	@user = User.find(session[:user_id])
  end

  def update
  	
  end
end