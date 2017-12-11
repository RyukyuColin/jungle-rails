require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should be valid with all fields given' do
      @category_name = Category.create! name: 'Apparel'
      @product = Product.new({
        name:  'Men\'s Classy shirt',
        quantity: 10,
        price: 64.99,
        category: @category_name
      })
      expect(@product).to be_valid
    end
    it 'should not be valid without a name' do
      @category_name = Category.create! name: 'Apparel'
      @product = Product.new({
        name:  nil,
        quantity: 10,
        price: 64.99,
        category: @category_name
      })
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include('Name can\'t be blank')
    end
    it 'should not be valid without a quantity' do
      @category_name = Category.create! name: 'Apparel'
      @product = Product.new({
        name:  'Men\'s Classy shirt',
        quantity: nil,
        price: 64.99,
        category: @category_name
      })
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include('Quantity can\'t be blank')
    end
    it 'should not be valid without a price' do
      @category_name = Category.create! name: 'Apparel'
      @product = Product.new({
        name:  'Men\'s Classy shirt',
        quantity: 10,
        price: nil,
        category: @category_name
      })
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include('Price can\'t be blank')
    end
    it 'should not be valid without a category' do
      @category_name = Category.create! name: 'Apparel'
      @product = Product.new({
        name:  'Men\'s Classy shirt',
        quantity: 10,
        price: 64.99,
        category: nil
      })
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include('Category can\'t be blank')
    end
  end
end


