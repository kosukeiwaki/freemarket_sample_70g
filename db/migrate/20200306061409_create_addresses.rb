class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer     :zip, null: false
      t.string      :prefecture, null: false
      t.string      :city, null: false
      t.string      :block
      t.string      :building
      t.integer     :phone_number
      t.string      :lastname, null: false
      t.string      :firstname, null: false
      t.string      :lastname_kana, null: false
      t.string      :firstname_kana, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
