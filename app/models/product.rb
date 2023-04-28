class Product < ApplicationRecord
  belongs_to :user
  has_many   :ufo_catcher,      through: :product_ufo
  validates  :order_date,       presence: true
  validates  :product_name,     presence: true
  validates  :product_price,    presence: true
  validates  :product_quantity, presence: true
  validates  :product_type,     presence: true
  validates  :user_id,          presence: true
end
