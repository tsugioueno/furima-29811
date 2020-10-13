class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string :postal_code,    null: false
      t.integer :shipping_area_id,  null: false   #Activehash
      t.string :city,    null: false
      t.string :addresses,    null: false
      t.string :building_name
      t.string :phone_number,    null: false
      t.references :item_purchase, foreign_key: true
    end
  end
end
