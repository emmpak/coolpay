require './app/models/http_client'

describe HTTPClient do
  let(:path) {'login'}
  subject(:client) { described_class.new(path: path) }


  describe('#uri') do
    it('returns the given uri parsed') do
      expect(client.uri).to be_kind_of(URI)
    end
  end

  describe('#http') do
    it('creates an http objet') do
      expect(client.http).to be_kind_of(Net::HTTP)
    end
  end

  describe('#get_request_uri') do
    it('returns the path') do
      expect(client.get_request_uri).to eq "/api/#{path}"
    end
  end
end
