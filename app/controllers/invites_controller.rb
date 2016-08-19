class InvitesController < ApplicationController
  def create
  	user = User.find(session[:user_id])
  	friend = User.find(params[:id])
  	inviteSent = Invite.where(user:friend, invitee: user).first
  	inviteRecieved = Invite.where(user:user, invitee: friend).first
  	friendCheck = Network.where(user:user, friend: friend).first
  	if inviteSent.nil? && inviteRecieved.nil? && friendCheck.nil?
  		Invite.create(user: friend, invitee: user)
  	end
  	redirect_to professional_profile_path
  end

  def destroy
  	Invite.find(params[:id]).delete
  	redirect_to(:back)
  end
end
