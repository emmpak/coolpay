class Coolpay < Sinatra::Base

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
end
