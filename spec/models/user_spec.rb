require 'rails_helper'
describe User do
  describe '#create' do
    it "is invalid without a email" do
     user = User.new(email: "", password: "aaaaaaaa", password_confirmation: "aaaaaaaa")
     user.valid?
     expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid within a email" do
     user = User.new(email: "test2@test.co.jp", password: "aaaaaaaa", password_confirmation: "aaaaaaaa")
     expect(user).to be_valid
    end
  end
end
