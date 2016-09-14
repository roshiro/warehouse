class Users
  PATH = '/api/users/'

  # Return user
  #
  # @param username [String] username of the user
  # @return [Hash] Hash representing user
  def self.user_by_username(username)
    RequestDispatcher.get("#{PATH}#{username}")['user']
  end

  private_constant :PATH
end
