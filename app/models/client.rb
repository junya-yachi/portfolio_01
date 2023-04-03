class Client < ApplicationRecord
  belongs_to :user
  validates  :cilent_name,  presence: true
  validates  :phone_num,    presence: true,
                            length: { maximum: 20 },
                            numericality: { only_integer: true}
  validates  :client_email, presence: true,
                            length: { maximum: 256 }
  def phone_num=(value)
    value.tr!('０-９', '0-9') if value.is_a?(String)
    super(value)
  end
end
