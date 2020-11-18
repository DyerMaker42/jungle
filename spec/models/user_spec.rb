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

    it 'is not valid if email entered already exists' do
      @user = User.create(
        first_name: "testy", 
        last_name: "test",
        email: "test1@test.com", 
        password:  "secure_password", 
        password_confirmation: "secure_password")
      @user1 = User.create(
        first_name: "testy", 
        last_name: "test",
        email: "test1@test.com", 
        password: "secure_password", 
        password_confirmation: "secure_password")
        expect(@user).to be_valid
        expect(@user1).to_not be_valid
      expect(@user1.errors.full_messages).to eq ["Email has already been taken"]
    end

    it 'is not valid if no first name ' do
      @user = User.create(
        first_name: nil, 
        last_name: "test",
        email: "test1@test.com", 
        password: "password", 
        password_confirmation: "password")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to eq ["First name can't be blank"]
    end

    it 'is not valid if no last name ' do
      @user = User.create(
        first_name: "test", 
        last_name: nil,
        email: "test1@test.com", 
        password: "password", 
        password_confirmation: "password")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to eq ["Last name can't be blank"]
    end
   
    it 'should have an email ' do
      @user = User.create(
        first_name: "test", 
        last_name: "Johnson",
        email: nil, 
        password: "password", 
        password_confirmation: "password")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to eq ["Email can't be blank"]
    end

    it "should have a password greater than or equal to 8 characters" do
      @user = User.create(
        first_name: "test", 
        last_name: "Johnson",
        email: "test1@Johnson.com", 
        password: "uhoh", 
        password_confirmation: "uhoh")
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 8 characters)"
      end
  end

  describe '.authenticate_with_credentials' do

    it 'should not authenticate if credentials do not match' do
      @user = User.create(
        first_name: "test", 
        last_name: "Johnson",
        email: "alpha@omega.net", 
        password: "password", 
        password_confirmation: "password")
      @user.save
      invalid = User.authenticate_with_credentials("alpha@omega.net", "password1")
      expect(invalid).to_not eq (@user)
    end
  
    it 'should  authenticate if credentials do match even if case sensitive' do
      @user = User.create(
        first_name: "test", 
        last_name: "Johnson",
        email: "alpha@omega.net", 
        password: "password", 
        password_confirmation: "password")
      @user.save
      valid = User.authenticate_with_credentials("Alpha@Omega.net", "password")
      expect(valid).to eq (@user)
    end
  
  
  
  end

end
