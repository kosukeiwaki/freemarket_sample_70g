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

  end
end