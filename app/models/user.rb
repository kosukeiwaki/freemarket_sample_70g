class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :nickname, :email, :password, :firstname,:lastname, :lastname_kana, :firstname_kana, :birthday, presence: { message: 'が入力されていません' }
  validates :email, format: {
    with:  /\A\S+@\S+\.\S+\z/, message: "メールアドレスが正しくありません"
  }
  validates :lastname, :firstname, format: {
    with: /\A[ぁ-んァ-ヶー一-龠]+\z/, message: "全角で入力してください"
  }
  validates :lastname_kana, :firstname_kana, format: {
    with: /\A[ぁ-んー－]+\z/, message: "全角ひらがなで入力してください"
  }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :address
  accepts_nested_attributes_for :address

end
