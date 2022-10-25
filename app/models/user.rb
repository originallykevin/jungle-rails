class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :password, length: { minimum: 4 , 
    too_short: "is too short (mimimum is %{count} characters)" }, presence: true
  validates :email, presence:true, uniqueness: { case_sensitive: false }, on: :create

end
