class CreateUfoCatchers < ActiveRecord::Migration[6.1]
  def change
    create_table :ufo_catchers do |t|
      t.string :machine_id
      t.string :machine_name
      t.integer :credit_num

      t.timestamps
    end
  end
end
