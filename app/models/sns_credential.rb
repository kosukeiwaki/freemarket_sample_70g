class SnsCredential < ApplicationRecord
  validates :provider, :uid, presence: { message: 'が入力されていません' }
  belongs_to :user, optional: true
end
