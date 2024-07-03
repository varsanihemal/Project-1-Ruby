class CreateCryptocurrencies < ActiveRecord::Migration[7.1]
  def change
    create_table :cryptocurrencies do |t|
      t.string :name
      t.string :symbol
      t.decimal :market_cap
      t.decimal :price
      t.decimal :volume_24h

      t.timestamps
    end
  end
end
