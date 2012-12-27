ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')
require 'sinatra'
require 'rack/test'
require 'rack/recaptcha'
require 'rspec'


set :environment, :test


module TestMethods
  def app
    Sinatra::Application
  end

  def accept_json
    header 'Accept', 'application/json'
  end
end


RSpec.configure do |config|
  config.before(:each) do
    DataMapper.auto_migrate!
    Rack::Recaptcha.test_mode!
    accept_json
  end
  config.include Rack::Test::Methods
  config.include TestMethods
end
