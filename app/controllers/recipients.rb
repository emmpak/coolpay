class Coolpay < Sinatra::Base

  post '/recipients' do
    api.send_request(path: 'recipients', type: 'POST', token: token)
    redirect to '/payments'
  end
end
