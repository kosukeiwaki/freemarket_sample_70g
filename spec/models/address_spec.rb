require 'rails_helper'

describe Address do
  describe '#create' do

    it "is valid with a zip, prefecture, city, lastname, firstname, lastname_kana, firstname_kana" do
      address = build(:address)
      expect(address).to be_valid
    end

    it "is invalid without an zip" do
      address = build(:address, zip: "")
      address.valid?
      expect(address.errors[:zip]).to include("can't be blank")
    end

    it "is invalid without an prefecture" do
      address = build(:address, prefecture: "")
      address.valid?
      expect(address.errors[:prefecture]).to include("can't be blank")
    end

    it "is invalid without an city" do
      address = build(:address, city: "")
      address.valid?
      expect(address.errors[:city]).to include("can't be blank")
    end

    it "is invalid without an lastname" do
      address = build(:address, lastname: "")
      address.valid?
      expect(address.errors[:lastname]).to include("can't be blank")
    end

    it "is invalid without an firstname" do
      address = build(:address, firstname: "")
      address.valid?
      expect(address.errors[:firstname]).to include("can't be blank")
    end

    it "is invalid without an lastname_kana" do
      address = build(:address, lastname_kana: "")
      address.valid?
      expect(address.errors[:lastname_kana]).to include("can't be blank")
    end

    it "is invalid without an firstname_kana" do
      address = build(:address, firstname_kana: "")
      address.valid?
      expect(address.errors[:firstname_kana]).to include("can't be blank")
    end

  end
end