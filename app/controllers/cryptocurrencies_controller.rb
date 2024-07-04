class CryptocurrenciesController < ApplicationController
  def index
    @cryptocurrencies = Cryptocurrency.all
  end

  def show
    @cryptocurrency  = Cryptocurrency.find(params[:id])
    @exchanges = @cryptocurrency.exchanges
  end
end
