class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :password, length: { minimum: 4 , 
    too_short: "is too short (mimimum is %{count} characters)" }, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, on: :create

  def self.authenticate_with_credentials(email, password)

    @user = User.find_by_email(email.strip.downcase)

    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end
end
