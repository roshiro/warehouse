class RequestDispatcher
  include ::HTTParty

  base_uri 'http://74.50.59.155:6000/'

  # Returns the cached result or makes the GET Request.
  #
  # @param path [String] URL
  def self.get_and_cache(path)
    self.cache[path] || (self.cache[path] = self.get(path))
  end

  def self.cache
    @@ccache ||= {}
  end
end
