class ChangeInvitesTable < ActiveRecord::Migration
  def change
  	remove_column(:invites, :friend_id)
  	add_reference(:invites, :invitee)
  end
end
