class WalletCryptocurrency < ApplicationRecord

  validates :wallet_id, presence: true
  validates :cryptocurrency_id, presence: true

  belongs_to :wallet
  belongs_to :cryptocurrency
end
