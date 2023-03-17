class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.date :order_date
      t.string :product_name
      t.integer :product_price
      t.integer :product_quantity
      t.string :product_type

      t.timestamps
    end
  end
end
