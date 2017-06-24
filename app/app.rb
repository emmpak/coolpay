require 'sinatra/base'
require 'uri'
require 'net/http'
require 'json'
require 'dotenv/load'

require_relative 'models/post_request'
require_relative 'models/http_client'
require_relative 'models/credentials'


class Coolpay < Sinatra::Base
  enable :sessions

  helpers do
    def token
      @token ||= session[:token]
    end
  end

  get '/' do
    erb :'index'
  end

  post '/users' do
    client = HTTPClient.new(uri: "https://coolpay.herokuapp.com/api/login")
    credentials = Credentials.new.format_json
    response = PostRequest.new(client: client, body_message: credentials).send
    session[:token] = JSON.parse(response.body)['token']
    redirect to '/payments'
  end

  get '/payments' do
    erb :'payments/index'
  end

  post '/recipients/new' do
    client = HTTPClient.new(uri: "https://coolpay.herokuapp.com/api/recipients")
    request = PostRequest.new(client: client, body_message: {'recipient': {'name': params[:recipient]}})
    response = request.send(token: token)
    p response.body
    redirect to '/payments'
  end
end
