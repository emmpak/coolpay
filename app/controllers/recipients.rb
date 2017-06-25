class Coolpay < Sinatra::Base

  post '/recipients' do
    client = HTTPClient.new(uri: "https://coolpay.herokuapp.com/api/recipients")
    request = HTTPRequest.new(type: 'POST', uri: client.get_request_uri)
    response = client.http.request(request.build(message: {'recipient': {'name': params[:recipient]}}, token: token))
    redirect to '/payments'
  end
end
