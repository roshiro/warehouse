require 'httparty'
require 'redis'
require './app'
require './lib/users'
require './lib/purchases'
require './lib/products'
require './lib/request_dispatcher'

run App
