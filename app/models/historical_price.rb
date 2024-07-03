class HistoricalPrice < ApplicationRecord

  validates :price, numericality: true
  validates :datetime, presence: true

  belongs_to :cryptocurrency
end
