class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string     :name
      t.integer    :price
      t.string     :size
      t.string     :brand
      t.string     :status
      t.integer    :fee
      t.string     :region
      t.string     :shipping_date
      # t.references :user_id, foreign_key: true
      # t.references :item_category_id, foreign_key: true
      t.timestamps
    end
  end
end
