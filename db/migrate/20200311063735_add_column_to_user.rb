class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname,  :string
    add_column :users, :lastname,  :string
    add_column :users, :firstname, :string
    add_column :users, :birthday,  :integer
  end
end
