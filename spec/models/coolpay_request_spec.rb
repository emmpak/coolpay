require './app/models/coolpay_request'

describe CoolpayRequest do
  let(:uri) { "https://www.google.com" }
  subject(:request) { described_class.new(uri) }


  describe('uri') do
    it('returns the given uri parsed') do
      expect(request.uri).to be_kind_of(URI)
    end
  end
end
