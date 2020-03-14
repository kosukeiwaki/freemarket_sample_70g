require 'rails_helper'

describe Card do
  describe '#create' do

    it "is valid with a user_id, customer_id, card_id" do
      user = build(:user)
      expect(user).to be_valid
    end

  end
end
