class Exchange < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  validates :website_url, presence: true

  has_many :cryptocurrency_exchanges
  has_many :cryptocurrencies, through: :cryptocurrency_exchanges
end
