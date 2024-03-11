require 'rails_helper'
require "product"
require "category"

RSpec.describe Product, type: :model do
  describe 'Validations' do
    context "when creating a new product it validates:" do
      
      before :each do
        @category = Category.new(name: "Cats")
        expect(@category.save).to be_truthy
      end

      it " That it Saves succesfully with all required fields" do
        @product = Product.new({name: "Cheshire", description: "A bad cat", category_id: @category.id, quantity: 100, image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/Tennel_Cheshire_proof.png", price: 1000000 })
        @product.valid?
        expect(@product).to be_valid
        expect(@product.errors).not_to be_present
      end

      it "Validates :name, presence: true" do
        @product = Product.new({name: nil, description: "A bad cat", category_id: @category.id, quantity: 100, image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/Tennel_Cheshire_proof.png", price: 1000000 })
        @product.valid?
        expect(@product.errors[:name]).to be_present
        expect(@product).not_to be_valid
      end

      it "Validates :price, prescence: true" do
        @product = Product.new({name: "Cheshire", description: "A bad cat", category_id: @category.id, quantity: 100, image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/Tennel_Cheshire_proof.png", price_cents: nil })
        @product.valid?
        expect(@product.errors[:price_cents]).to be_present
        expect(@product).not_to be_valid
      end

      it "Validates :quantity, prescence: true" do
        @product = Product.new({name: "Cheshire", description: "A bad cat", category_id: @category.id, quantity: nil, image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/Tennel_Cheshire_proof.png", price_cents: 10000 })
        @product.valid?
        expect(@product.errors[:quantity]).to be_present
        expect(@product).not_to be_valid
      end

      it "Validates :category, prescence: true" do
        @product = Product.new({name: "Cheshire", description: "A bad cat", category_id: nil, quantity: nil, image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/Tennel_Cheshire_proof.png", price_cents: 10000 })
        @product.valid?
        expect(@product.errors[:category]).to be_present
        expect(@product).not_to be_valid
      end
      
    end
  end
end
