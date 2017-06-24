require './app/models/credentials'

describe Credentials do
  let(:info) { {'username': ENV['USERNAME'], 'apikey': ENV['API_KEY'] } }
  subject(:credentials) { described_class.new }

  describe('#format') do
    it('formats the given credentials into json format') do
      expect(credentials.format_json).to eq info
    end
  end
end
