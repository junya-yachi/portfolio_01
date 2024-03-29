FactoryBot.define do
  factory :client do
    cilent_name { Faker::Company.name }
    phone_num { Faker::Number.number(digits: 10) }
    client_email { Faker::Internet.free_email }
  end
end
