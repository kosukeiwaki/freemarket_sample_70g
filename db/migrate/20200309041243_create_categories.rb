class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :item_category

      t.timestamps
    end
  end
end
