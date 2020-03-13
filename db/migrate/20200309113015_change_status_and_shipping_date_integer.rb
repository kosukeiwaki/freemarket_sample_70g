class ChangeStatusAndShippingDateInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :status, :integer
    change_column :items, :shipping_date, :integer
  end
end
