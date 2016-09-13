# app.rb
require 'sinatra'

class App < Sinatra::Base
  get '/' do
    'Hello World'
  end

  get '/api/recent_purchases/:username' do
    purchases = ::Purchases.recent_purchases_by_user(params[:username])
    purchases['purchases'].map do |product_id|
      people = ::Purchases.people_who_purchased(product_id)
      product = ::Product.products_by_id(product_id)
    end
    # 1. fetch 5 recent purchases for the user: GET /api/purchases/by_user/:username?limit=5
    # 2. for each of those products, get a list of all people who previously purchased that product: GET /api/purchases/by_product/:product_id
    # 3. at the same time, request info about the products: GET /api/products/:product_id
    # 4. finally, put all of the data together and sort it so that the product with the highest number of recent purchases is first.
    # ex.:
    # [
    #   {
    #     "id": 555622,
    #     "face": "｡◕‿◕｡",
    #     "price": 1100,
    #     "size": 27,
    #     "recent": [
    #       "Frannie79",
    #       "Barney_Bins18",
    #       "Hortense6",
    #       "Melvina84"
    #     ]
    #   },
    #   ...
    # ]
  end
end
