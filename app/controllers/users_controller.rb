class UsersController < ApplicationController
  before_action :require_login, except: [:create, :main]
  def welcome
    if session[:user_id]
      redirect_to professional_profile_path
    else
      redirect_to main_path
    end
  end
  def main
  end
  def index
    user = User.find(session[:user_id])
    @all_except = User.where.not(id: user.friends).where.not(id: user.invitees).where.not(id: user.id)
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to professional_profile_path
    else
      flash[:errors] = user.errors.full_messages
      redirect_to main_path
    end
  end
  def professional_profile
    @user = User.find(session[:user_id])
    @friends = @user.friends
    @invites = @user.invites
  end
  def show
    @target = User.find(params[:id])
  end

  private
  def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :description)
  end
end
