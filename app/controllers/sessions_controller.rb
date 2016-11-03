class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    session[:omniauth] = auth
    user = User.sign_in_from_omniauth auth
    session[:user_id] = user.id

    if user
      redirect_to root_url, notice: "Ha iniciado sesión correctamente!"
    else
      redirect_to root_url, notice: "No se pudo iniciar la sesión!"
    end
    
  end

  def destroy
   session[:user_id] = nil
   session[:omniauth] = nil
   redirect_to root_url, notice: "Ha cerrado su sesión correctamente!"
  end
end