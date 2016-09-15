class Purchases
  PATH = '/api/purchases'

  # Returns most recent purchases by user
  #
  # @param username [String] username
  # @return [Array] Array of purchases
  def self.recent_purchases_by_user(username)
    ::RequestDispatcher.get_and_cache("#{PATH}/by_user/#{username}?limit=5")['purchases']
  end

  # Returns people who purchased a specific product.
  #
  # @param product_id [Integet] Product ID
  # @return [Array] Array of purchases
  def self.purchases_by_product(product_id)
    ::RequestDispatcher.get_and_cache("#{PATH}/by_product/#{product_id}")['purchases']
  end

  private_constant :PATH
end
