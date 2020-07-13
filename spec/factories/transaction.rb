FactoryBot.define do
  factory :transaction do
    customer_email { "fake@example.com" }
    sale_price { 999 }
    association :book
  end
end
