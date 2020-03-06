class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :zip, :prefecture, :city, :lastname, :firstname, :lastname_kana, :firstname_kana ,presence: true
end
