require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'Validations' do

    it 'should create products' do
      expect(Product.new).to be_a Product
    end
  end
  
end
