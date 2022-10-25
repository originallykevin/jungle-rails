require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    # password and password_confirmation must match
    it 'validates input of password is same as password confirmation' do
      user = User.create(name:'Nori Cet', email:'nori@cet.com', password:'password', password_confirmation:'notpassword')
      user.errors.full_messages
    expect(user.errors.full_messages).to include(/Password/)
    end

    # email must be unique 
    it 'validates email uniqueness for case sensitivity' do
      user1 = User.create(name:'Nori Cat', email: 'test@test.COM', password:'password', password_confirmation:'password')
      user1.save
      user2 = User.create(name:'Nori Cat', email: 'TEST@TEST.com', password:'password', password_confirmation:'password')
      user2.save
    expect(user2.errors.full_messages).to include(/Email/)
    end
  end

  describe '.authenticate_with_credentials' do
    
  end

end
