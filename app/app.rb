require 'sinatra/base'
require 'uri'
require 'net/http'
require 'json'
require 'dotenv/load'

class Coolpay < Sinatra::Base

  get '/' do
    erb :'index'
  end

  post '/users' do
    coolpay = CoolpayRequest.new(uri: "https://coolpay.herokuapp.com/api/login")
    header = {'Content-Type': 'application/json'}
    credentials = {
        "username": ENV['USERNAME'],
        "apikey": ENV['API_KEY']
    }
    request = coolpay.set_post_request(body: credentials, header: header)
    response = coolpay.http.request(request)
    p response.body
    redirect to '/payments'
  end

  get '/payments' do

  end
end
