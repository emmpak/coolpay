# require 'net/http'
require './app/models/coolpay_request'

describe CoolpayRequest do
  let(:uri) { "https://www.google.com" }
  subject(:request) { described_class.new(uri) }


  describe('#uri') do
    it('returns the given uri parsed') do
      expect(request.uri).to be_kind_of(URI)
    end
  end

  describe('#set_http') do
    it('creates an http objet') do
      expect(request.set_http).to be_kind_of(Net::HTTP)
    end
  end
end
