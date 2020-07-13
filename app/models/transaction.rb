class Transaction < ApplicationRecord
  belongs_to :book

  validates :customer_email, presence: true
  validates :sale_price, presence: true

  after_save :send_to_service

  private

  def send_to_service
    serialized_transaction = TransactionSerializer.new(self).as_json(include: "**")
    PaymentServiceJob.perform_later(payload: serialized_transaction)
  end
end
