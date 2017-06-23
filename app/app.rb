require 'sinatra/base'
require 'net/http'

class Coolpay < Sinatra::Base

  get '/' do
    erb :'index'
  end

  post '/users' do
    redirect to '/payments'
  end

  get '/payments' do

  end
end
