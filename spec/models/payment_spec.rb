require './app/models/payment'

describe Payment do
  let(:details) { {
                    "payment": {
                      "amount": 100,
                      "currency": "GBP",
                      "recipient_id": "123"
                    }
                  }
                }
  subject(:payment) { described_class.new(amount: 100, currency: 'GBP', id: '123') }

  describe('#format_json') do
    it('formats the given details into json format') do
      expect(payment.format_json).to eq details
    end
  end
end
