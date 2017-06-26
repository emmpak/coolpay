class Coolpay < Sinatra::Base

  post '/users' do
    credentials = Credentials.new.format_json
    response = CoolpayAPI.new.login(credentials)
    session[:token] = JSON.parse(response.body)['token']
    redirect to '/payments'
  end
end
