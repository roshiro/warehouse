class Products
  PATH = '/api/products/'

  # Returns product details
  #
  # @param product_id [Integet] product ID
  # @return [Object] HTTP Response
  def self.product_by_id(product_id)
    RequestDispatcher.get("#{PATH}#{product_id}")['product']
  end

  private_constant :PATH
end
