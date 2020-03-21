class Image < ApplicationRecord
  mount_uploader :picture, ImageUploader
  belongs_to :item
  validates :picture, presence: { message: '画像を選択してください' }

end