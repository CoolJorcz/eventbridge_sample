class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :customer_email, :sale_price

  belongs_to :book
end
