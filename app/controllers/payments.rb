require './app/models/payment'

class Coolpay < Sinatra::Base

  get '/payments' do
    recipients_response = api.send_request(path: 'recipients', type: 'GET', token: token)
    @recipients = JSON.parse(recipients_response.body)['recipients']

    payments_response = api.send_request(path: 'payments', type: 'GET', token: token)
    @payments = JSON.parse(payments_response.body)['payments']
    erb :'payments/index'
  end

  post '/payments' do
    message = Payment.new(amount: params['amount'], currency: params['currency'], id: params['id']).format_json
    api.send_request(path: 'payments', type: 'POST', token: token, message: message)
    redirect to '/payments'
  end
end
