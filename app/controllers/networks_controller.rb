class NetworksController < ApplicationController
  def create
  	user = User.find(session[:user_id])
  	friend = User.find(params[:id])
  	Network.create(user: user, friend: friend)
  	Network.create(user: friend, friend: user)
  	invite = Invite.where(user: friend, invitee: user)
  		if invite
  			Invite.where(user: user).where(invitee: friend).first.delete
  		end
  	redirect_to(:back)
  end
end
