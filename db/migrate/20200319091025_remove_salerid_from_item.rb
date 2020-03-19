class RemoveSaleridFromItem < ActiveRecord::Migration[5.2]
  def change
    remove_reference :items, :saler
  end
end
