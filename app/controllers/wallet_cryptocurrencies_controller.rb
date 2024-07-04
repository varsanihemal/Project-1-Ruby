class WalletCryptocurrenciesController < ApplicationController
  def index
    @wallet = Wallet.find(params[:wallet_id])
    @wallet_cryptocurrencies = @wallet.wallet_cryptocurrencies
  end

  def show
    @wallet_cryptocurrency = WalletCryptocurrency.find(params[:id])
  end
end
