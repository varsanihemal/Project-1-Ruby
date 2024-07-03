class Wallet < ApplicationRecord

  validates :name, presence: true

  belongs_to :user
  has_many :wallet_cryptocurrencies
  has_many :cryptocurrencies, through: :wallet_cryptocurrencies
end
