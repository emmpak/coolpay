class Payment

  def initialize(amount:, currency:, id:)
    @amount = amount
    @currency = currency
    @id = id
  end

  def format_json
    {
      "payment": {
        "amount": amount,
        "currency": currency,
        "recipient_id": id
      }
    }
  end

  private
  attr_reader :amount, :currency, :id
end
