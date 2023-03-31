class CreateInventories < ActiveRecord::Migration[6.1]
  def change
    create_table :inventories do |t|
      t.integer :product_id
      t.integer :acutual_inventory
      t.integer :forecast_stock

      t.timestamps
    end
  end
end
