class RequestDispatcher
  include ::HTTParty

  base_uri 'http://74.50.59.155:6000/'

  # Returns the cached result or makes the GET Request.
  #
  # @param path [String] URL
  def self.get_and_cache(path)
    if cached = self.cache.get(path)
      JSON.parse(cached)
    else
      result = self.get(path)
      self.cache.set(path, result.to_json)
      result
    end
  end

  def self.cache
    @@redis ||= Redis.new(:url => "redis://:warehouse@pub-redis-19214.us-east-1-3.2.ec2.garantiadata.com:19214")
    @@redis
  end
end
