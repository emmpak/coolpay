require 'sinatra/base'
require 'uri'
require 'net/http'
require 'json'
require 'dotenv/load'

require_relative 'models/post_request'
require_relative 'models/http_client'

class Coolpay < Sinatra::Base

  get '/' do
    erb :'index'
  end

  post '/users' do

    client = HTTPClient.new(uri: "https://coolpay.herokuapp.com/api/login")
    response = Login.new(client: client).send_request

    # credentials = {
    #     "username": ENV['USERNAME'],
    #     "apikey": ENV['API_KEY']
    # }
    # request = coolpay.set_post_request(body: credentials)
    # response = coolpay.http.request(request)
    p response.body
    redirect to '/payments'
  end

  get '/payments' do

  end
end
