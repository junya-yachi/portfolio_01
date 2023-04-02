class Client < ApplicationRecord
  belongs_to :user
  validates  :cilent_name,  presence: true
  validates  :phone_num,    presence: true
  validates  :client_email, presence: true
end
