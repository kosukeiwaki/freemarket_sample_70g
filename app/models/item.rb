class Item < ApplicationRecord
  has_many :images
  validates :name, :price, :size, :status, :fee, :region, :shipping_date, :stok, presence: true






  def when_item_sold_out(item)
    if item.stock == 1
      "売り切れです"
    # else 
    #   # item.image
    #   item.name 
    #   item.price
    #   item.status
    end
  end
end
