require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    it 'should have a name' do
      @category = Category.new(name: "Clothing")
      @category.name = "Clothing"
      @product = Product.new(name: "Nice Pants", price: 5000, quantity: 99, category: @category)
      @product.save
      expect(@product.name).to be_present  
    end
    
    it 'should have a price' do
      @category = Category.new(name: "Clothing")
      @category.name = "Clothing"
      @product = Product.new(name: "Nice Pants", price: 5000, quantity: 99, category: @category)
      @product.save
      expect(@product.price).to be_present 
      expect(@product.price).to be_a_kind_of(Money) 
      
    end
    
    it 'should have a quantity' do
      @category = Category.new(name: "Clothing")
      @category.name = "Clothing"
      @product = Product.new(name: "Nice Pants", price: 5000, quantity: 99, category: @category)
      @product.save
      expect(@product.quantity).to be_present 
      expect(@product.quantity).to be_a_kind_of(Integer) 
    end
    
    it 'should have a category' do
      @category = Category.new(name: "Clothing")
      @category.name = "Clothing"
      @product = Product.new(name: "Nice Pants", price: 5000, quantity: 99, category: @category)
      @product.save
      expect(@product.category).to be_present 
    end

    it 'should give an error message the name field is missing' do
      @category = Category.new(name: "Clothing")
      @category.name = "Clothing"
      @product = Product.new(price: 5000, quantity: 99, category: @category)
      @product.save
      expect(@product.errors.full_messages).to_not be_empty
    end

  end
end
