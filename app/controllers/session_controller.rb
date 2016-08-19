class SessionController < ApplicationController
  def create
  	user = User.find_by_email(user_params[:email])
  	if user && user.authenticate(user_params[:password])
  		session[:user_id] = user.id.to_i
  		redirect_to professional_profile_path
  	else 
  		redirect_to main_path, notice: "Invalid"
  	end
  end

  def destroy
  	session.clear
  	redirect_to main_path
  end
  def user_params
  	params.require(:user).permit(:password, :email)
  end
end
