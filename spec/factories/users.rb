FactoryBot.define do
  factory :user do
    name                  {"test"}
    email                 {"test@gmail.com"}
    password              {"111111"}
    password_confirmation {"111111"}
  end
end
