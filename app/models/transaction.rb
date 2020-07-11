class Transaction < ApplicationRecord
  belongs_to :book

  validates :customer_email, presence: true
  validates :transaction_id, presence: true, uniqueness: true
  validates :sale_price, presence: true
end
