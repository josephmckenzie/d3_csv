require 'sinatra'
require 'csv'

get '/' do
    erb :index
end

post '/update' do
station = params["station"]
price = params["price"]
CSV.open("public/gas_prices.csv", "ab") do |csv|
  csv << [station,price]
    csv.close
end
redirect '/'
end