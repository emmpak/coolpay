require 'sinatra/base'
require 'uri'
require 'net/http'
require 'json'
require 'dotenv/load'

require_relative 'models/post_request'
require_relative 'models/http_client'
require_relative 'models/credentials'


class Coolpay < Sinatra::Base

  get '/' do
    erb :'index'
  end

  post '/users' do
    client = HTTPClient.new(uri: "https://coolpay.herokuapp.com/api/login")
    credentials = Credentials.new.format_json
    response = PostRequest.new(client: client, credentials: credentials).send
    p response.body
    redirect to '/payments'
  end

  get '/payments' do

  end
end
