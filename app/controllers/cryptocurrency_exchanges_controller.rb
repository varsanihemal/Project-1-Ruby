class CryptocurrencyExchangesController < ApplicationController
  def index
    @cryptocurrency = Cryptocurrency.find(params[:cryptocurrency_id])
    @cryptocurrency_exchanges = @cryptocurrency.cryptocurrency_exchanges
  end

  def show
    @cryptocurrency_exchange = CryptocurrencyExchange.find(params[:id])
  end
end
