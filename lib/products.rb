class Products
  PATH = '/api/products/'

  # Returns product details
  #
  # @param product_id [Integet] product ID
  # @return [Object] HTTP Response
  def self.products_by_id(product_id)
    RequestDispatcher.get("#{PATH}#{product_id}")
  end

  # private_constant :PATH
end
