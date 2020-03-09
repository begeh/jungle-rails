require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "product is valid" do
      category = Category.new(name: "Gym Clothes")
      product = Product.new(name:"Gym shoes", price: 23.00, quantity: 1, category: category)
      expect(product).to be_valid
    end
    it "is not valid without name" do
      category = Category.new(name: "Gym Clothes")
      product = Product.new(name: nil, price: 23.00, quantity: 1, category: category)
      expect(product).to_not be_valid
    end
    it "is not valid without price" do
      category = Category.new(name: "Gym Clothes")
      product = Product.new(name: "Gym shoes", price: nil, quantity: 1, category: category)
      expect(product).to_not be_valid
    end
    it "is not valid without quantity" do
      category = Category.new(name: "Gym Clothes")
      product = Product.new(name: "Gym shoes", price: 23.00, quantity: nil, category: category)
      expect(product).to_not be_valid
    end
    it "is not valid without category" do
      product = Product.new(name: "Gym shoes", price: 23.00, quantity: 1, category: nil)
      expect(product).to_not be_valid
    end
  end
end