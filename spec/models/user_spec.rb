require 'rails_helper'

RSpec.describe User, type: :model do
  

  it 'should create a user' do
    expect(User.create).to be_a User
  end
end
