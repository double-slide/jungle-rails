require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do


    before do
      @test_category = Category.new(:name => "Tester")
    end


    it "saves with all four fields set" do
      test_product = Product.new({ :name => "Test", :price => 100, :quantity => 1, :category => @test_category })
      expect(test_product).to be_valid
    end


    it "does not save if name is excluded" do
      test_product = Product.new({ :price => 100, :quantity => 1, :category => @test_category })
      expect(test_product).not_to be_valid
    end


    it "does not save if price is excluded" do
      test_product = Product.new({ :name => "Test", :quantity => 1, :category => @test_category })
      expect(test_product).not_to be_valid
    end


    it "does not save if quantity is excluded" do
      test_product = Product.new({ :name => "Test", :price => 100, :category => @test_category })
      expect(test_product).not_to be_valid
    end


    it "does not save if category is excluded" do
      test_product = Product.new({ :name => "Test", :price => 100, :quantity => 1})
      expect(test_product).not_to be_valid
    end

  end
end
