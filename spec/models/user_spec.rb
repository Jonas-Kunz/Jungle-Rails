require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    context "When creating a new user it validates:" do
      it "Succesfully saves a new user when given all required fields correctly" do
        @user = User.new({first_name: "Souper", last_name: "Man", email: "email@email.com", password: "123456", password_confirmation: "123456"})
        @user.valid?
        expect(@user).to be_valid
        expect(@user.save).to be_truthy
      end

      it "Validates :first_name, presence: true" do 
        @user = User.new({first_name: nil, last_name: "Man", email: "email@email.com", password: "123456", password_confirmation: "123456"})
        @user.valid?
        expect(@user).to be_invalid
        expect(@user.errors[:first_name]).to be_present
      end

      it "Validates :last_name, prescence: true" do
        @user = User.new({first_name: "Souper", last_name: nil, email: "email@email.com", password: "123456", password_confirmation: "123456"})
        @user.valid?
        expect(@user).to be_invalid
        expect(@user.errors[:last_name]).to be_present
      end

      it "Validates :email, prescence: true" do
        @user = User.new({first_name: "Souper", last_name: "Man", email: nil, password: "123456", password_confirmation: "123456"})
        @user.valid?
        expect(@user).to be_invalid
        expect(@user.errors[:email]).to be_present
      end

      it "validates password, and password_confirmation match" do
        @user = User.new({first_name: "Souper", last_name: "Man", email: "email@email.com", password: "123456", password_confirmation: "654321"})
        @user.valid?
        expect(@user).to be_invalid
        expect(@user.save).to be_falsy
      end

      it "Validates email is unique case insensitive" do
        @user1 = User.new({first_name: "Souper", last_name: "Man", email: "email@email.com", password: "123456", password_confirmation: "123456"})
        @user2 = User.new({first_name: "Bat------", last_name: "-----Man", email: "email@email.com", password: "111111", password_confirmation: "111111"})
        @user1.save
        @user2.save
        expect(@user1).to be_valid
        expect(@user2).to be_invalid
        expect(@user2.errors).to be_present
      end

      it "Validates :password, length: {within: 6..40}" do
        @user1 = User.new({first_name: "Bat------", last_name: "-----Man", email: "email@email.com", password: "456", password_confirmation: "456"})
        @user2 = User.new({first_name: "Bat------", last_name: "-----Man", email: "email@email.com", password: "111111111111111111111111111111111111111111111", password_confirmation: "111111111111111111111111111111111111111111111"})
        @user1.valid?
        @user2.valid? 
        expect(@user1).to be_invalid
        expect(@user2).to be_invalid
      end
    end
  end

  describe ".authenticate_with_credentials" do
    context "When logging in it:" do
      before :each do
        @user = User.new({first_name: "Souper", last_name: "Man", email: "email@email.com", password: "123456", password_confirmation: "123456"})
        expect(@user.save).to be_truthy
      end
      
      it "Returns user given valid credentials" do
        user = User.authenticate_with_credentials("email@email.com", "123456")
        expect(user).to be_present
        expect(user.id).to eq(@user.id)
      end

      it "Returns nil when given invalid credentials" do 
        user = User.authenticate_with_credentials("em", "1123144412412123")
        expect(user).to eq(nil)
      end

      it "Authenticates succesfully when given valid email with extra white space" do
        expect(User.authenticate_with_credentials("    email@email.com   ", "123456")).to be_truthy
      end

      it "Authenticates succesfully given valid email with wrong case" do
        expect(User.authenticate_with_credentials("EMAIL@EMAIL.com", "123456")).to be_truthy
      end
    end
  end
end
