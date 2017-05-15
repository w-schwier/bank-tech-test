class Account
  STARTING_BALANCE = 0

  attr_reader :balance, :transaction_log

  def initialize
    @balance = STARTING_BALANCE
    @transaction_log = []
  end

  def deposit(amount)
    @balance += amount
    @transaction_log.push(Transaction.create(amount, "Deposit", @balance))
  end

  def withdraw(amount)
    raise "Can't withdraw: not enough money" unless withdraw_ok?(amount)
    @balance -= amount
    @transaction_log.push(Transaction.create(amount, "Withdrawal", @balance))
  end

  private

  def withdraw_ok?(amount)
    (amount - @balance) < 0
  end
end
