class User < ApplicationRecord
  has_secure_password

  validates :email, confirmation: { case_sensitive: false }, uniqueness: true, on: :create

  validates :name, presence: true
  validates :password_digest, length: { minimum: 4 , 
    too_short: "is too short (mimimum is %{count} characters)" }
  validates :email, presence:true, confirmation: { case_sensitive: false }

end
