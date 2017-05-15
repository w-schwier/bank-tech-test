class Account
  STARTING_BALANCE = 0

  attr_reader :balance, :statement

  def initialize(statement: Statement.new)
    @balance = STARTING_BALANCE
    @statement = statement
  end

  def my_balance
    "£%.2f" % self.balance#.to_s.reverse.gsub(/...(?=.)/,'\&,').reverse
  end

  def deposit(amount)
    self.balance += amount
    self.make_transaction(amount, "Deposit")
  end

  def withdraw(amount)
    raise "Can't withdraw: not enough money" unless withdraw_ok?(amount)
    self.balance -= amount
    self.make_transaction(amount, "Withdrawal")
  end

  def my_statement
    self.statement.print_statement
  end

  def make_transaction(amount, type)
    self.statement.add_transaction(Transaction.create(amount, type, self.balance))
  end

  private

  attr_writer :balance

  def withdraw_ok?(amount)
    (amount - self.balance) < 0
  end
end
