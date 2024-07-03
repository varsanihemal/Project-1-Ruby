class CryptocurrencyExchange < ApplicationRecord
  belongs_to :cryptocurrency
  belongs_to :exchange
end
