class Product < ApplicationRecord
  validates :order_date, presence: true
  validates :product_name, presence: true
  validates :product_price, presence: true
  validates :product_quantity, presence: true
  validates :product_type, presence: true
  validates :user_id, presence: true

  belongs_to :user
end
