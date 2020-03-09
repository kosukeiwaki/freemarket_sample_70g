class AddFuriganaColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :lastname_kana, :string, null: false

    add_column :users, :firstname_kana, :string, null: false
  end
end
