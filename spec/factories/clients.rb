FactoryBot.define do
  factory :client do
    user_id { Faker::Number }
    cilent_name { Faker::Name.name }
    phone_num { Faker::Number.between(from: 7, to: 20) }
    client_email { Faker::Internet.free_email }
  end
end
