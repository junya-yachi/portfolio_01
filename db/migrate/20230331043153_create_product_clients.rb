class CreateProductClients < ActiveRecord::Migration[6.1]
  def change
    create_table :product_clients do |t|
      t.integer :product_id
      t.integer :client_id

      t.timestamps
    end
  end
end
