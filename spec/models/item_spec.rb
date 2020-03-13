require 'rails_helper'

describe Item do
  describe '#update' do 
    it "is invalid without a name" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include('が入力されていません')
    end

    it "is invalid without a detail" do
      item = build(:item, detail: "")
      item.valid?
      expect(item.errors[:detail]).to include('が入力されていません')
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

    it "is invalid without a region" do
      item = build(:item, region: "")
      item.valid?
      expect(item.errors[:region]).to include('が入力されていません')
    end

    it "is invalid without a shippng_date" do
      item = build(:item, shipping_date: "")
      item.valid?
      expect(item.errors[:shipping_date]).to include('が入力されていません')
    end
  end
end