require 'rack/recaptcha'
require './config/recaptcha'


use Rack::Recaptcha,
    :public_key => Recaptcha::get_pubkey,
    :private_key => Recaptcha::get_privkey

enable :sessions


require './app'
run Sinatra::Application
