class Coolpay < Sinatra::Base

  post '/users' do
    client = HTTPClient.new(uri: "https://coolpay.herokuapp.com/api/login")
    credentials = Credentials.new.format_json
    request = HTTPRequest.new(type: 'POST', uri: client.get_request_uri)
    response = client.http.request(request.build(message: credentials))
    session[:token] = JSON.parse(response.body)['token']
    redirect to '/payments'
  end
end
