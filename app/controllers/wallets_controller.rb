class WalletsController < ApplicationController
  def index
    @wallets = Wallet.all
  end

  def show
    @wallet = Wallet.find(params[:id])
    @cryptocurrencies = @wallet.cryptocurrencies
  end
end
