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
    
    # email, name should be required
    it 'validates email and name to be required' do
      user = User.create(name: nil, email: nil, password:'password')
      expect(user.errors.full_messages).to include(/Name/)
      expect(user.errors.full_messages).to include(/Email/)
    end

    # password min length 4
    it 'validates password to have minimum length of 4' do
      user = User.create(name: 'Nori Cet', email:'nori@cet.com', password: 'pas')
      expect(user.errors.full_messages).to include(/Password/)
    end
  end

  describe '.authenticate_with_credentials' do
    it 'validates authenticate_with_credentials method and utilize authenticate instance method' do
      @user = User.create(name: 'Nori Cet', email:'testemail@email.com', password:'12345', password_confirmation:'12345')
      authenticated = User.authenticate_with_credentials('testemail@email.com', '12345')

      expect(authenticated).to be_present
      expect(authenticated).to be_truthy
      
    end

    it 'should allow for white space before and after email input' do
      @user = User.create(name: 'Nori Cet', email:'testemail@email.com', password:'12345', password_confirmation:'12345')
      authenticated = User.authenticate_with_credentials(' testemail@email.com ', '12345')

      expect(authenticated).to be_present
      expect(authenticated).to be_truthy
    end

    it 'should allow user to authenticate successfully with different case sensitive email input' do
      @user = User.create(name: 'Nori Cet', email:'testemail@email.com', password:'12345', password_confirmation:'12345')
      authenticated = User.authenticate_with_credentials('teSTEMail@email.com', '12345')
      
      expect(authenticated).to be_present
      expect(authenticated).to be_truthy
    end
  end

end
