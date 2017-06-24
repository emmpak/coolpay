require './app/models/credentials'

describe Credentials do
  let(:default) { {'username': ENV['USERNAME'], 'apikey': ENV['API_KEY'] } }
  let(:other)  { {"username": "your_username", "apikey": "5up3r$ecretKey!"} }
  subject(:credentials) { described_class.new }

  describe('#format') do
    it('formats the default credentials into json format') do
      expect(credentials.format_json).to eq default
    end

    it('formats the given credentials into json format') do
      cr = described_class.new(username: "your_username", apikey: "5up3r$ecretKey!")
      expect(cr.format_json).to eq other
    end
  end
end
