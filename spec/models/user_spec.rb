require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    # password and password_confirmation must match
    it 'validates input of password is same as password confirmation' do
      user = User.create(name:'Nori Cet', password:'password', password_confirmation:'notpassword')
    expect(user.errors.full_messages).to include(/Password/)
    end
  end

  describe '.authenticate_with_credentials' do
    
  end

end
