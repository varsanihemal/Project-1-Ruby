class CreateHistoricalPrices < ActiveRecord::Migration[7.1]
  def change
    create_table :historical_prices do |t|
      t.decimal :price
      t.datetime :datetime
      t.references :cryptocurrency, null: false, foreign_key: true

      t.timestamps
    end
  end
end
