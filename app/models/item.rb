class Item < ApplicationRecord
  belongs_to :user
  has_many :images
  has_many :items_categories
  has_many :categories, through: :items_categories   
  validates :name, :price, :size, :status, :fee, :region, :shipping_date, :detail, presence: { message: 'が入力されていません'}
  def when_item_sold_out(item)
    if item.blank?
      "売り切れです"
    # else 
    #   # item.image
    #   item.name 
    #   item.price
    #   item.status
    end
  end
end
