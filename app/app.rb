require 'sinatra/base'
require 'uri'
require 'net/http'
require 'json'
require 'dotenv/load'

require_relative 'models/http_client'
require_relative 'models/credentials'
require_relative 'models/http_request'



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
    request = HTTPRequest.new(type: 'POST', uri: client.get_request_uri)
    response = client.http.request(request.build(message: credentials))
    session[:token] = JSON.parse(response.body)['token']
    redirect to '/payments'
  end

  get '/payments' do
    client = HTTPClient.new(uri: "https://coolpay.herokuapp.com/api/recipients")
    request = HTTPRequest.new(type: 'GET', uri: client.get_request_uri)
    response = client.http.request(request.build(token: token))
    @recipients = JSON.parse(response.body)['recipients']

    client = HTTPClient.new(uri: "https://coolpay.herokuapp.com/api/payments")
    request = HTTPRequest.new(type: 'GET', uri: client.get_request_uri)
    response = client.http.request(request.build(token: token))
    @payments = JSON.parse(response.body)['payments']
    erb :'payments/index'
  end

  post '/payments' do
    client = HTTPClient.new(uri: "https://coolpay.herokuapp.com/api/payments")
    request = HTTPRequest.new(type: 'POST', uri: client.get_request_uri)
    message = {
                "payment": {
                  "amount": params['amount'],
                  "currency": params['currency'],
                  "recipient_id": params['id']
                }
              }
    response = client.http.request(request.build(message: message, token: token))
    redirect to '/payments'
  end

  post '/recipients' do
    client = HTTPClient.new(uri: "https://coolpay.herokuapp.com/api/recipients")
    request = HTTPRequest.new(type: 'POST', uri: client.get_request_uri)
    response = client.http.request(request.build(message: {'recipient': {'name': params[:recipient]}}, token: token))
    redirect to '/payments'
  end
end
