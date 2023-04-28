class UfoCatcher < ApplicationRecord
  validates  :machine_id,       presence: true
  validates  :machine_name,     presence: true
  validates  :credit_num,       presence: true
end
