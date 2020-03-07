class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :zip, :prefecture, :city, :lastname, :firstname, :lastname_kana, :firstname_kana, presence: true
  validates :zip, numericality: true
  validates :lastname, :firstname, format: {
    with: /\A[ぁ-んァ-ヶー一-龠]+\z/, message: "全角で入力してください"
  }
  validates :firstname_kana, :lastname_kana, format: {
    with: /\A[ぁ-んー－]+\z/, message: "全角ひらがなで入力してください"
  }
  
end
