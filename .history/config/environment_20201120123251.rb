ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => "db/#{ENV['SINATRA_ENV']}.database_production"
)


require './app/controllers/application_controller'
require_all 'app'
require './app/controllers/destinations_controller'
require './app/controllers/users_controller'
require 'sinatra/flash'

enable :sessions