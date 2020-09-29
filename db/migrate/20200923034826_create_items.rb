class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product_name,    null: false
      t.text   :product_text,    null: false
      t.integer :price,    null: false
    
    end
  end
end
