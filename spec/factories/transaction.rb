FactoryBot.define do
  factory :transaction do
    transaction_id { 1234 }
    customer_email { 'fake@example.com' }
    sale_price { 999 }
    association :book
  end
end