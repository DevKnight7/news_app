require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    let(:user) { create(:user) }

    it "is valid with valid attributes" do
      expect(user).to be_valid
    end

    it "is not valid without an email" do
      user = User.new(
        password: "password",
        password_confirmation: "password"
      )
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is not valid without a password" do
      user = User.new(
        email: "test@example.com",
        password_confirmation: "password"
      )
      expect(user).not_to be_valid
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is not valid with a short password" do
      user = User.new(
        email: "test@example.com",
        password: "1234",
        password_confirmation: "1234"
      )
      expect(user).not_to be_valid
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end

    it "is not valid with a password confirmation that does not match" do
      user = User.new(
        email: "test@example.com",
        password: "password",
        password_confirmation: "password123"
      )
      expect(user).not_to be_valid
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
  end

  describe "associations" do
    it "has many favorites" do
      user = User.new
      
      expect(user).to have_many(:favorites)
    end
  end
end

