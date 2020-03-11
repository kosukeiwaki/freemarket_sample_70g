require 'rails_helper'

describe Item do
  describe '#create' do

    it "is invalid without a name" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include('が入力されていません')
    end

    it "is invalid without a price" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include('が入力されていません')
    end

    it "is invalid without a status" do
      item = build(:item, status: "")
      item.valid?
      expect(item.errors[:status]).to include('が入力されていません')
    end

    it "is invalid without a fee" do
      item = build(:item, fee: "")
      item.valid?
      expect(item.errors[:fee]).to include('が入力されていません')
    end

    it "is invalid without a shipping_date" do
      item = build(:item, shipping_date: "")
      item.valid?
      expect(item.errors[:shipping_date]).to include('が入力されていません')
    end

    it "is invalid without a detail" do
      item = build(:item, detail: "")
      item.valid?
      expect(item.errors[:detail]).to include('が入力されていません')
    end

    it "is invalid without a prefecture_id" do
      item = build(:item, prefecture_id: "")
      item.valid?
      expect(item.errors[:prefecture_id]).to include('が入力されていません')
    end


  end
end