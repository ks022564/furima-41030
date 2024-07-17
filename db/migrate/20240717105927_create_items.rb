class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name,                        null: false
      t.text :item_text,                          null: false
      t.integer :price,                           null: false
      t.integer :category_id,                     null: false
      t.integer :item_condition_id,               null: false
      t.integer :shipping_fee_responsibility_id,  null: false
      t.integer :prefecture_id,                   null: false
      t.integer :estimated_shipping_date_id,      null: false
      t.references :user,                         null: false, foregin_key: true

      t.timestamps
    end
  end
end
