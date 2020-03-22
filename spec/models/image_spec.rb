require 'rails_helper'

describe Image do
  describe '#create' do
    it "is invalid without a picture" do
      image = Image.new(id: 1, item_id: 1, picture: "")
      image.valid?
      expect(item.errors[:picture]).to include('Images is invalid')
    end
  end
end