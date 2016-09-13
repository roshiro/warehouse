class Purchases
  PATH = '/api/purchases'

  # Returns most recent purchases by user
  #
  # @param username [String] username
  # @return [Object] HTTP Response
  def self.recent_purchases_by_user(username)
    ::RequestDispatcher.get("#{PATH}/by_user/#{username}?limit=5")
  end

  # Returns people who purchased a specific product.
  #
  # @param product_id [Integet] Product ID
  # @return [Object] HTTP Response
  def self.people_who_purchased(product_id)
    ::RequestDispatcher.get("#{PATH}/by_product/#{product_id}")
  end

  # private_constant :PATH
end
