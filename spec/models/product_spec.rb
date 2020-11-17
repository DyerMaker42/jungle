require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'Validations' do

    it 'should create products' do
      expect(Product.new).to be_a Product
    end
  
    it 'is valid and with valid attributes' do
      @category = Category.new(name:"shoes")
      @product = Product.new(
        id:200,
        name:"Red Shoe", 
        price_cents: 2000, 
        quantity: 10, 
        category: @category
      )
      expect(@product).to be_valid
    end

    it 'should contain a name' do
      @category = Category.new(name:"shoes")
      @product = Product.new(
        id:200,
        name:nil, 
        price_cents: 2000, 
        quantity: 10, 
        category: @category
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eq ["Name can't be blank"]
    end

  
      
  end

end
