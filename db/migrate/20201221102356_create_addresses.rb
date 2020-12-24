class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :p_code,             null: false
      t.integer :prefecture_id,     null: false
      t.string :city,               null: false
      t.string :address,            null: false
      t.string :building,           null: false
      t.string :p_num,              null: false
      t.references :purchase_m,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
