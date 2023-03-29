class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.integer :user_id
      t.string :cilent_name
      t.string :phone_num
      t.string :client_email

      t.timestamps
    end
  end
end
