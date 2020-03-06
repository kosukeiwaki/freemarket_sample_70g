class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string     :name, null: false
      t.integer    :price, null: false
      t.string     :size, null: false
      t.string     :brand
      t.string     :status, null: false
      t.integer    :fee, null: false
      t.string     :region, null: false
      t.string     :shipping_date, null: false
      # t.references :user, foreign_key: true      
      # t.references :item_category, foreign_key: true
      t.timestamps
    end
  end
end
