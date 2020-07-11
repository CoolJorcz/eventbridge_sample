class Transaction < ApplicationRecord
  belongs_to :book

  validates :customer_email, presence: true
  validates :transaction_id, presence: true, uniqueness: true
  validates :sale_price, presence: true

  after_save :send_to_service

  private

  def send_to_service
    PaymentServiceJob.perform_later(payload: self.as_json)
  end
end
