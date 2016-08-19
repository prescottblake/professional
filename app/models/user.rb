class User < ActiveRecord::Base
  has_secure_password
  validates :name, :password, :email, :description, presence:true
  validates_length_of :password, minimum: 8
  validates_confirmation_of :password, message: "must match Password"
  validates :email.downcase, uniqueness:true
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/


  has_many :networks, :foreign_key => "user_id"
  has_many :friends, :through => :networks

  has_many :invites, :foreign_key => "user_id"
  has_many :invitees, :through => :invites
end
