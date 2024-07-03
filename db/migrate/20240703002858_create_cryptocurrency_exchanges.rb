class CreateCryptocurrencyExchanges < ActiveRecord::Migration[7.1]
  def change
    create_table :cryptocurrency_exchanges do |t|
      t.references :cryptocurrency, null: false, foreign_key: true
      t.references :exchange, null: false, foreign_key: true

      t.timestamps
    end
  end
end
