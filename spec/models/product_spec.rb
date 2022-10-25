require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'Validations' do

    # validates :name, presence: true
    it 'validates product name' do
      product = Product.new 
      product.name = "Airpods"
      expect(product.name).to be_present
    end

    # validates :price, presence: true
    it 'validates product price' do
      product = Product.new 
      product.price = 200
      expect(product.price).to be_present
    end

    # validates :quantity, presence: true
    it 'validates product quantity' do
      product = Product.new 
      product.quantity = 100
      expect(product.quantity).to be_present
    end

    # validates :category, presence: true
    it 'validates product category' do
      product = Product.new 
      product.category_id = 1
      expect(product.category_id).to be_present
    end

    #ensures that a product with all four fields set will indeed save successfully
    it 'product with all four fields set will be save' do
      product = Product.new 
      product.name = "Airpods"
      product.price = 200
      product.quantity = 100
      product.category_id = 1

      expect(product.name).to be_present
      expect(product.price).to be_present
      expect(product.quantity).to be_present
      expect(product.category_id).to be_present

    end

  end
end

