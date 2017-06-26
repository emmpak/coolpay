require './app/models/http_client'

describe HTTPClient do
  let(:uri) { "https://coolpay.herokuapp.com/api/login" }
  subject(:request) { described_class.new(uri: uri) }


  describe('#uri') do
    it('returns the given uri parsed') do
      expect(request.uri).to be_kind_of(URI)
    end
  end

  describe('#http') do
    it('creates an http objet') do
      expect(request.http).to be_kind_of(Net::HTTP)
    end
  end

  describe('#get_request_uri') do
    it('returns the path') do
      expect(request.get_request_uri).to eq '/api/login'
    end
  end
end
