class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :password_digest, length: { minimum: 4 , 
    too_short: "is too short (mimimum is %{count} characters)" }
  validates :email, presence:true, uniqueness: { case_sensitive: false }, on: :create

end
