json.extract! transactions, :id, :sale_price, :customer_email, :created_at, :updated_at
json.url transactions_url(transactions, format: :json)
