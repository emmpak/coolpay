require 'sinatra/base'
require 'uri'
require 'net/http'
require 'json'
require 'dotenv/load'

require_relative 'models/credentials'
require_relative 'models/coolpay_api'

class Coolpay < Sinatra::Base
  enable :sessions

  helpers do
    def api
      @api = CoolpayAPI.new
    end

    def token
      @token ||= session[:token]
    end
  end

  get '/' do
    erb :'index'
  end
end

require_relative 'controllers/payments'
require_relative 'controllers/users'
require_relative 'controllers/recipients'
