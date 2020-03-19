class Image < ApplicationRecord
  # validates :picture, presence: { message: '画像を選択してください' }
  mount_uploader :picture, ImageUploader
  belongs_to :item

end