class ChangeUserIdInItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :user
  end
end
