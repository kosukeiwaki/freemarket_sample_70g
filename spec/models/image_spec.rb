require 'rails_helper'

describe Image do
  describe '#create' do
    it "is invalid without a picture" do
      image = Image.new(picture: "")
      image.valid?
      expect(image.errors[:picture]).to include('画像を選択してください')
    end
  end
end

RSpec.describe Image, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
