class CryptocurrenciesController < ApplicationController
  def index
    @cryptocurrencies = if params[:search].present?
                          Cryptocurrency.where("name LIKE ?", "%#{params[:search]}%")
                        else
                          Cryptocurrency.all
                        end
  end

  def show
    @cryptocurrency = Cryptocurrency.find(params[:id])
    @exchanges = @cryptocurrency.exchanges
  end
end
