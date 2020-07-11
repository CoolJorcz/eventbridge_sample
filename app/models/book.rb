class Book < ApplicationRecord
  has_many :transactions, dependent: :destroy

  validates :title, presence: true
  validates :author, presence: true
end
