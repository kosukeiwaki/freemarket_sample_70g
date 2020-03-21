class AddcategorysToItems < ActiveRecord::Migration[5.2]
  def change
    # add_column :items, :category, :string
    add_reference :items, :category, foreign_key: true
  end
end
