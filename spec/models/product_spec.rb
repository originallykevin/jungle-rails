require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # create category name before all test 
    before(:each) do
      @category = Category.create(name:"Electronic")
    end

    # validates :name, presence: true
    it 'validates product name' do
      product = Product.new 
      product.name = "Airpods"
      expect(product.name).to be_present
    end
    
    it 'validates product name' do
      product = Product.create(price: 200, quantity:100, category_id:@category.id)
      expect(product.name).to be_nil
      expect(product.errors.full_messages).to include(/Name/)
      expect(product).not_to be_valid
    end

    # validates :price, presence: true
    it 'validates product price' do
      product = Product.new 
      product.price = 100
      expect(product.price).to be_present
    end

    it 'validates product price' do
      product = Product.create(name:"Airpod", quantity:100, category_id:@category.id)
      expect(product.price).to be_nil
      expect(product.errors.full_messages).to include(/Price/)
      expect(product).not_to be_valid
    end

    # validates :quantity, presence: true
    it 'validates product quantity' do
      product = Product.new 
      product.quantity = 100
      expect(product.quantity).to be_present
    end

    it 'validates product quantity' do
      product = Product.create(name:"Airpod", price: 200, category_id:@category.id)
      expect(product.quantity).to be_nil
      expect(product.errors.full_messages).to include(/Quantity/)
      expect(product).not_to be_valid
    end

    # validates :category, presence: true
    it 'validates product category' do
      product = Product.new 
      product.category_id = 1
      expect(product.category_id).to be_present
    end

    it 'validates product category' do
      product = Product.create(name:"Airpod", price: 200, quantity: 100)
      expect(product.category).to be_nil
      expect(product.errors.full_messages).to include(/Category/)
      expect(product).not_to be_valid
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

