class RequestDispatcher
  include HTTParty

  base_uri 'http://74.50.59.155:6000/'

  def self.get_and_cache(path)
    if self.cache[path]
      puts "cached #{path}"
      self.cache[path]
    else
      puts "caching #{path}"
      response = self.get(path)
      self.cache[path] = response
      response
    end
  end

  def self.cache
    @@ccache ||= {}
  end
end
