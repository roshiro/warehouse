require 'rubygems'
require 'bundler'
Bundler.setup(:default, :test)
require 'sinatra'
require 'rubygems'
require 'rspec'
require 'rack/test'
require 'httparty'

ENV['RACK_ENV'] = 'test'

require_relative '../app'
require_relative '../lib/users'
require_relative '../lib/purchases'
require_relative '../lib/products'
require_relative '../lib/request_dispatcher'

# set test environment
Sinatra::Base.set :environment, :test
Sinatra::Base.set :run, false
Sinatra::Base.set :raise_errors, true
Sinatra::Base.set :logging, false

module RSpecMixin
  include Rack::Test::Methods
  def app() App end
end

# For RSpec 2.x and 3.x
RSpec.configure { |c| c.include RSpecMixin }
