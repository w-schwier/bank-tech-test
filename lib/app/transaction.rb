class Transaction

  def self.create(amount, type, balance)
    {
      date: Time.now.strftime("%d/%m/%Y"),
      amount: "%.2f" % amount,
      type: type,
      balance: "%.2f" % balance
    }
  end
end
