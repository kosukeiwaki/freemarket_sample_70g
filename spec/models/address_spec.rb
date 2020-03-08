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
      expect(address.errors[:zip]).to include('が入力されていません')
    end

    it "is invalid without an prefecture" do
      address = build(:address, prefecture: "")
      address.valid?
      expect(address.errors[:prefecture]).to include('が入力されていません')
    end

    it "is invalid without an city" do
      address = build(:address, city: "")
      address.valid?
      expect(address.errors[:city]).to include('が入力されていません')
    end

    it "is invalid without an lastname" do
      address = build(:address, lastname: "")
      address.valid?
      expect(address.errors[:lastname]).to include('が入力されていません')
    end

    it "is invalid without an firstname" do
      address = build(:address, firstname: "")
      address.valid?
      expect(address.errors[:firstname]).to include('が入力されていません')
    end

    it "is invalid without an lastname_kana" do
      address = build(:address, lastname_kana: "")
      address.valid?
      expect(address.errors[:lastname_kana]).to include('が入力されていません')
    end

    it "is invalid without an firstname_kana" do
      address = build(:address, firstname_kana: "")
      address.valid?
      expect(address.errors[:firstname_kana]).to include('が入力されていません')
    end

    it 'is invalid entered in other than number' do
      address = build(:address, zip: "あああ")
      address.valid?
      expect(address.errors[:zip]).to include('は数字で入力してください')
    end

    it "is invalid entered in half-width" do
      address = build(:address, lastname: "nitta")
      address.valid?
      expect(address.errors[:lastname]).to include("全角で入力してください")
    end

    it "is invalid entered in half-width" do
      address = build(:address, firstname: "hitoshi")
      address.valid?
      expect(address.errors[:firstname]).to include("全角で入力してください")
    end

    it "is invalid entered in other than full-width hiragana" do
      address = build(:address, lastname_kana: "ニッタ")
      address.valid?
      expect(address.errors[:lastname_kana]).to include("全角ひらがなで入力してください")
    end

    it 'is invalid entered in other than full-width hiragana' do
      address = build(:address, firstname_kana: "ヒトシ")
      address.valid?
      expect(address.errors[:firstname_kana]).to include("全角ひらがなで入力してください")
    end


  end
end