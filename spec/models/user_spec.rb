require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it 'should create users' do
      expect(User.create).to be_a User
    end

    it 'is valid with valid attributes' do
      @user = User.create(
        first_name: "testy", 
        last_name: "test",
        email: "test1@test.com", 
        password: "password", 
        password_confirmation: "password")
      expect(@user).to be_valid
    end

    it 'is not valid if pass and pass confirmation do not match' do
      @user = User.create(
        first_name: "testy", 
        last_name: "test",
        email: "test1@test.com", 
        password: "password", 
        password_confirmation: "password1")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to eq ["Password confirmation doesn't match Password"]
    end

    it 'is not valid if no password is entered' do
      @user = User.create(
        first_name: "testy", 
        last_name: "test",
        email: "test1@test.com", 
        password: nil, 
        password_confirmation: nil)
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include ("Password can't be blank")
    end



  end
end
