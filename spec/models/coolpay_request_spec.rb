# require 'net/http'
require './app/models/coolpay_request'

describe CoolpayRequest do
  let(:uri) { "https://www.google.com" }
  let(:header) { {'Content-Type': 'application/json'} }
  let(:credentials) { {"username": "your_username","apikey": "5up3r$ecretKey!"} }
  subject(:request) { described_class.new(uri) }


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

  describe('#set_post_request') do
    before do
      @http_request = request.set_post_request(credentials, header)
    end

    it('creates a post request') do
      expect(@http_request).to be_kind_of(Net::HTTP::Post)
    end

    it('has stores the given message in the body of the request') do
      expect(@http_request.body).to eq(credentials.to_json)
    end

    it('has the given header') do
      expect(@http_request['content-type'.to_sym]).to eq 'application/json'
    end
  end
end
