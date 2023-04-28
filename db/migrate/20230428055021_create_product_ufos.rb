class CreateProductUfos < ActiveRecord::Migration[6.1]
  def change
    create_table :product_ufos do |t|
      t.references :product, null: false, foreign_key: true
      t.references :ufo_catcher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
