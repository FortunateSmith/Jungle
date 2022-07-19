require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before do
      @category = Category.new(:name => "Air Plants")
      @category.save
      @product = Product.new(:name => "George", :price => 55, :quantity => 666, :category => @category)
      @product.save
    end

    it "validates a product not valid if category is not present" do
      @product.category = nil
      expect(@product).to_not be_valid
    end
    
    it "validates a category exists" do
      expect(@product.category).to_not be_nil
    end
    
    it "validates a product not valid if name is not present" do
      @product.name = nil
      expect(@product).to_not be_valid
    end
    it "validates a product valid if name is present" do
      expect(@product.name).to eq("George")
    end

    it "validates a product not valid if quantity is not present" do
      @product.quantity = nil
      expect(@product).to_not be_valid
    end
    it "validates a product valid if quantity is present" do
      expect(@product.quantity).to eq(666)
    end

    it "validates a product not valid if price is 0" do
      @product.price = 0
      expect(@product.price_cents).to eq(0)
    end
    it "validates a product valid if price is present" do
      expect(@product.price_cents).to eq(5500)
    end

  end
end
