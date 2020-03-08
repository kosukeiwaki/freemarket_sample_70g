require 'rails_helper'

describe User do
  describe '#create' do

    it "is valid with a nickname, email, password, password_confirmation, lastname, firstname, lastname_kana, firstname_kana, birthday" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include('が入力されていません')
    end

    it "is invalid without an email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include('が入力されていません')
    end

    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include('が入力されていません')
    end

    it "is invalid without a lastname" do
      user = build(:user, lastname: "")
      user.valid?
      expect(user.errors[:lastname]).to include('が入力されていません')
    end

    it "is invalid without a firstname" do
      user = build(:user, firstname: "")
      user.valid?
      expect(user.errors[:firstname]).to include('が入力されていません')
    end

    it "is invalid without a lastname_kana" do
      user = build(:user, lastname_kana: "")
      user.valid?
      expect(user.errors[:lastname_kana]).to include('が入力されていません')
    end

    it "is invalid without a firstname_kana" do
      user = build(:user, firstname_kana: "")
      user.valid?
      expect(user.errors[:firstname_kana]).to include('が入力されていません')
    end

    it "is invalid without a birthday" do
      user = build(:user, birthday: "")
      user.valid?
      expect(user.errors[:birthday]).to include('が入力されていません')
    end



    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "is valid with a password that has more than 7 characters " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user).to be_valid
    end

    it "is invalid with a password that has less than 6 characters " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end


    it "@ is not include" do
      user = build(:user, email: "aaa.bbb")
      user.valid?
      expect(user.errors[:email]).to include("メールアドレスが正しくありません")
    end

    it ". is not include" do
      user = build(:user, email: "aaa@bbb")
      user.valid?
      expect(user.errors[:email]).to include("メールアドレスが正しくありません")
    end

    it "is invalid entered in half-width" do
      user = build(:user, lastname: "nitta")
      user.valid?
      expect(user.errors[:lastname]).to include("全角で入力してください")
    end

    it "is invalid entered in half-width" do
      user = build(:user, firstname: "hitoshi")
      user.valid?
      expect(user.errors[:firstname]).to include("全角で入力してください")
    end

    it "is invalid entered in other than full-width hiragana" do
      user = build(:user, lastname_kana: "ニッタ")
      user.valid?
      expect(user.errors[:lastname_kana]).to include("全角ひらがなで入力してください")
    end

    it 'is invalid entered in other than full-width hiragana' do
      user = build(:user, firstname_kana: "ヒトシ")
      user.valid?
      expect(user.errors[:firstname_kana]).to include("全角ひらがなで入力してください")
    end


  end
end
