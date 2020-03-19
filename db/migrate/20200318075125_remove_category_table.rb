class RemoveCategoryTable < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :items, :categories
    remove_index :items, :category_id
    remove_reference :items, :category
  end
end
