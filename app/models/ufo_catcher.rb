class UfoCatcher < ApplicationRecord
  has_many   :product,      through: :product_ufo
  validates  :machine_id,       presence: true
  validates  :machine_name,     presence: true
  validates  :credit_num,       presence: true
end
