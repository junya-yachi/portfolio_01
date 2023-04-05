class Client < ApplicationRecord
  belongs_to :user
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates  :cilent_name,  presence: true
  validates  :phone_num,    presence: true,
                            length: { maximum: 20 },
                            numericality: { only_integer: true }
  validates  :client_email, presence: true,
                            length: { maximum: 256 }, format: { with: VALID_EMAIL_REGEX, message: "は英文字 + @~ の形式で入力してください" }
  def phone_num=(value)
    value.tr!('０-９', '0-9') if value.is_a?(String)
    super(value)
  end
end
