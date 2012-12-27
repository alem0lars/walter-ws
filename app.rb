require 'sinatra'
require 'sinatra/json'
require 'json'
require 'data_mapper'
require 'pony'
require 'rack/recaptcha'

require './lib/walter_ws'

Dir["./config/*.rb"].each { |config| require config }

#################
# Configuration #
#################

Dir["./models/*.rb"].each { |model| require model }

configure :development do
  DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/db/db.sqlite")
  DataMapper::Logger.new('log/db.log', :debug) # displays SQL queries
  PonyConfig.new :development
end
configure :production do
  PonyConfig.new :production
end
configure :test do
  DataMapper.setup(:default, "sqlite3::memory:")
end
DataMapper.finalize

set :json_encoder, :to_json
set :show_exceptions, false

helpers Rack::Recaptcha::Helpers

#######################
# RESTful application #
#######################

# Returns all open services
get '/services' do
  json Service.all(open: true)
end

Dir["./services/*.rb"].each { |service| require service }
