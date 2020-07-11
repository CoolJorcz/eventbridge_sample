json.extract! transactions, :id, :title, :author, :created_at, :updated_at
json.url transactions_url(transactions, format: :json)
