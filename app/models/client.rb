class Client < ApplicationRecord
  belongs_to :user
  validates  :cilent_name,  presence: true
  validates  :phone_num,    length: { maximum: 20 }
  validates  :client_email, length: { maximum: 256 }
end
