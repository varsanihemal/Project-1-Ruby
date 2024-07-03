class WalletCryptocurrency < ApplicationRecord
  belongs_to :wallet
  belongs_to :cryptocurrency
end
