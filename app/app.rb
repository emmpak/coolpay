require 'sinatra/base'
require 'uri'
require 'net/http'
require 'json'

class Coolpay < Sinatra::Base

  get '/' do
    erb :'index'
  end

  post '/users' do
    uri = URI.parse("https://coolpay.herokuapp.com/api/login")
    header = {'Content-Type': 'application/json'}
    credentials = {
        "username": "",
        "apikey": ""
    }
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.request_uri, header)
    request.body = credentials.to_json
    response = http.request(request)
    p response.body
    redirect to '/payments'
  end

  get '/payments' do

  end
end
