class Book < ApplicationRecord
  has_many :transactions, dependent: :destroy

  validates :title, presence: true
  validates :author, presence: true

  def title_and_author
    "#{title} by #{author}"
  end
end
