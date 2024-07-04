require 'faker'
require 'httparty'
require 'csv'

# Clear existing data
User.destroy_all
Wallet.destroy_all
WalletCryptocurrency.destroy_all
Cryptocurrency.destroy_all
Exchange.destroy_all
CryptocurrencyExchange.destroy_all

# Reset primary key sequences for SQLite
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='users'")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='wallets'")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='wallet_cryptocurrencies'")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='cryptocurrencies'")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='exchanges'")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='cryptocurrency_exchanges'")

# Fetching data from CoinRanking API
url = 'https://api.coinranking.com/v2/coins'
api_key = 'coinranking4376f7a4520e4fe073af09cc0f7a0476f5fec35a9f4e15f1'

response = HTTParty.get(url, headers: { 'x-access-token' => api_key })

if response.success?
  data = response.parsed_response['data']['coins']
  data.each do |coin|
    Cryptocurrency.create!(
      name: coin['name'],
      symbol: coin['symbol'],
      market_cap: coin['marketCap'].to_f,
      price: coin['price'].to_f,
      volume_24h: coin['24hVolume'].to_f
    )
  end
else
  puts "Failed fetching data from CoinRanking API"
  puts "Status code: #{response.code}"
  puts "Response body: #{response.body}"
end

# Generating fake data using Faker
20.times do
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email
  )

  5.times do
    wallet = Wallet.create!(
      name: Faker::Finance.credit_card(:mastercard),
      user: user
    )

    10.times do
      WalletCryptocurrency.create!(
        wallet: wallet,
        cryptocurrency: Cryptocurrency.order('RANDOM()').first
      )
    end
  end
end

# Loading CSV data
csv_path = Rails.root.join('db', 'exchanges.csv')

CSV.foreach(csv_path, headers: true) do |row|
  if row['name'].present? && row['website_url'].present?
    Exchange.create!(
      name: row['name'],
      website_url: row['website_url']
    )
  else
    puts "Skipping invalid exchange row: #{row}"
  end
end

cryptocurrencies = Cryptocurrency.all
exchanges = Exchange.all

cryptocurrencies.each do |cryptocurrency|
  selected_exchanges = exchanges.sample(3) # Randomly select 3 exchanges
  selected_exchanges.each do |exchange|
    CryptocurrencyExchange.create!(
      cryptocurrency: cryptocurrency,
      exchange: exchange
    )
  end
end


# Final count
total_count = Cryptocurrency.count + Exchange.count + User.count + Wallet.count + WalletCryptocurrency.count + CryptocurrencyExchange.count
puts "Final total row count: #{total_count}"
