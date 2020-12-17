class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title,          null: false
      t.text :explain,          null: false
      t.integer :category_id,       null: false
      t.integer :condition_id,      null: false
      t.integer :s_fee_id,          null: false
      t.integer :area_id,           null: false
      t.integer :d_f_ship_id,      null: false
      t.references :user,       foreign_key: true
      t.timestamps
    end
  end
end
