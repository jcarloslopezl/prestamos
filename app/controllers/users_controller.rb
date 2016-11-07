class UsersController < ApplicationController
	before_action :set_user, except: [:destroy]
  
	
  def index
  end

  def show
  end

  def profile
  	@user = User.find(session[:user_id])
  end

  def update
  	if @user.update(user_params)
  		redirect_to @user, notice: 'Se han actualizado sus datos correctamente.'
  	else
  		render :edit
  	end
  end

  private

  def set_user
  	@user = User.find(session[:user_id])
  end

  def user_params
    params.require(:user).permit(:first_name, 
    														 :second_name, 
    														 :second_last_name, 
    														 :first_last_name, 
    														 :birth_date, 
    														 :curp, 
    														 :rfc, 
    														 :gender, 
    														 :birth_state, 
    														 :phone_number)
  end

end