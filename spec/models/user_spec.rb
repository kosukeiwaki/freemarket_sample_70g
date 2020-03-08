require 'rails_helper'

describe User do
  describe '#create' do

    it "is invalid without a firstname_kana" do
      user = build(:user, firstname_kana: "")
      user.valid?
      expect(user.errors[:firstname_kana]).to include("can't be blank")
    end

    it "is invalid without an lastname_kana" do
      user = build(:user, lastname_kana: "")
      user.valid?
      expect(user.errors[:lastname_kana]).to include("can't be blank")
    end

    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid without an lastname" do
      user = build(:user, lastname: "")
      user.valid?
      expect(user.errors[:lastname]).to include("can't be blank")
    end

    it "is invalid without a firstname" do
      user = build(:user, firstname: "")
      user.valid?
      expect(user.errors[:firstname]).to include("can't be blank")
    end

    it "is invalid without an lastname_kana" do
      user = build(:user, lastname_kana: "")
      user.valid?
      expect(user.errors[:lastname_kana]).to include("can't be blank")
    end

    it "is invalid without a firstname_kana" do
      user = build(:user, firstname_kana: "")
      user.valid?
      expect(user.errors[:firstname_kana]).to include("can't be blank")
    end

    it "is invalid without an birthday" do
      user = build(:user, birthday: "")
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end

  end
end
