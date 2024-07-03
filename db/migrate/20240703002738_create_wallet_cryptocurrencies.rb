class CreateWalletCryptocurrencies < ActiveRecord::Migration[7.1]
  def change
    create_table :wallet_cryptocurrencies do |t|
      t.references :wallet, null: false, foreign_key: true
      t.references :cryptocurrency, null: false, foreign_key: true

      t.timestamps
    end
  end
end
