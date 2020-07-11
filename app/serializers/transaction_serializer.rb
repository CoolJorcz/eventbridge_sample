class TransactionSerializer < ActiveModel::Serializer
  attributes :transaction_id, :customer_email, :sale_price

  belongs_to :book
end
