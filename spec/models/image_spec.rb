require 'rails_helper'

it "is invalid without a image" do
  item = build(:item, image: "")
  item.valid?
  expect(item.errors[:image]).to include('画像を選択してください')
end