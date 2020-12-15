class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title,          null: false
      t.text :explain,          null: false
      t.string :category,       null: false
      t.string :condition,      null: false
      t.string :s_fee,          null: false
      t.string :area,           null: false
      t.string :days_to_s,      null: false
      t.references :user,       foreign_key: true
      t.timestamps
    end
  end
end
