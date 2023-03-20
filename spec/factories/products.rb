FactoryBot.define do
  factory :product do
    order_date { "2023-03-17" }
    product_name { "MyString" }
    product_price { 1 }
    product_quantity { 1 }
    product_type { "MyString" }
  end
end
