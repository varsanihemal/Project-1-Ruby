class CreateExchanges < ActiveRecord::Migration[7.1]
  def change
    create_table :exchanges do |t|
      t.string :name
      t.string :website_url

      t.timestamps
    end
  end
end
