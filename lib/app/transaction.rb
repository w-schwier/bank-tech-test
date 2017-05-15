class Transaction

  attr_reader :amount, :type, :balance

  def self.create(amount, type, balance)
    {
      date: Time.now.strftime("%d/%m/%Y"),
      amount: amount,
      type: type,
      balance: balance
    }
  end
end
