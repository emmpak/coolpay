require './app/models/coolpay_api'

describe CoolpayAPI do
  let(:http) { double(:http, request: { "token": "aff06fec-e041-4994-849e-223f0569e0bc" })}
  let(:http_client) { double(:http_client, get_request_uri: '/login', http: http)}
  let(:http_client_class) { double(:http_client_class, new: http_client) }
  let(:http_request) { double(:http_request, get_body: credentials, build: nil)}
  let(:http_request_class) { double(:http_request_class, new: http_request) }
  let(:credentials) { { "username": "your_username", "apikey": "5up3r$ecretKey!" } }
  subject(:api) { described_class.new(http_client_class: http_client_class, http_request_class: http_request_class) }

  describe('#login') do
    it('creates a new post http request') do
      expect(http_request_class).to receive(:new).with(type:'POST', uri:'/login')
      api.login(credentials)
    end

    it('creates a request containing the credentials') do
      expect(http_request).to receive(:build).with(message: credentials)
      api.login(credentials)
    end

    it('sends the request') do
      expect(http).to receive(:request).with(http_request.build)
      api.login(credentials)
    end
  end
end
