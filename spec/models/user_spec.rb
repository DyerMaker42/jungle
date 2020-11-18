require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    # it 'should create users' do
    #   expect(User.new).to be_a User
    # end

    it 'is valid with valid attributes' do
      @user = User.create(
        first_name: "testy", 
        last_name: "test",
        email: "test1@test.com", 
        password: "password", 
        password_confirmation: "password")
      expect(@user).to be_valid
    end

  end
end
