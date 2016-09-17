# app.rb
require 'sinatra'
require 'json'

class App < Sinatra::Base
  get '/api/recent_purchases/:username' do
    content_type :json
    if ::Users.user_by_username(params[:username]).nil?
      "User with username of '#{params[:username]}' was not found"
    else
      purchases = ::Purchases.recent_purchases_by_user(params[:username])
      purchases.map do |p|
        people = ::Purchases.purchases_by_product(p['productId']).map { |pp| pp['username'] }
        product = ::Products.product_by_id(p['productId'])
        {
          id: product['id'],
          face: product['face'],
          price: product['price'],
          size: product['size'],
          recent: people
        }
      end.sort_by { |hsh| hsh[:recent].length }.reverse.to_json
    end
  end
end
