class Cryptocurrency < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  validates :symbol, presence: true, uniqueness: true
  validates :market_cap, numericality: { greater_than_or_equal_to: 0}
  validates :price, numericality: { greater_than_or_equal_to: 0}
  validates :volume_24h, numericality: { greater_than_or_equal_to: 0}

  has_many :historical_prices
  has_many :wallet_cryptocurrencies
  has_many :wallets, through: :wallet_cryptocurrencies
  has_many :cryptocurrency_exchanges
  has_many :exchanges, through: :cryptocurrency_exchanges
end
