class AddDetailsToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :user_id, :integer
    add_column :products, :client_id, :integer
    add_column :products, :purchase_id, :integer
  end
end
