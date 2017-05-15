require 'app/account'

describe Account do
  subject(:account) {described_class.new}

  describe '#balance' do
    it {is_expected.to respond_to :balance}

    it "should start with a balance of 0" do
      expect(account.balance).to eq 0
    end

    it 'should print balance correctly' do
      account.deposit(3000)
      expect(account.my_balance).to eq "£3000.00"
    end
  end

  describe '#deposit' do

    before do
      @my_hash = {
        date: Time.now.strftime("%d/%m/%Y"),
        type: "Deposit",
        amount: "%.2f" % 10,
        balance: "%.2f" % 10
      }
    end

    it 'should increase balance' do
      account.deposit(20)
      expect(account.balance).to eq 20.00
    end

    it 'should push transaction to statement' do
      account.deposit(10)
      expect(account.statement.all.length).to eq 1
      expect(account.statement.all[0]).to eq @my_hash
    end

  end

  describe '#withdraw' do

    before do
      @my_hash = {
        date: Time.now.strftime("%d/%m/%Y"),
        type: "Withdrawal",
        amount: "%.2f" % 10,
        balance: "%.2f" % 20
      }
    end

    it 'should decrease balance' do
      account.deposit(20)
      account.withdraw(10)
      expect(account.balance).to eq 10.00
    end

    it "shouldn't allow you to withdrawn if new balance < 0" do
      message = "Can't withdraw: not enough money"
      expect{account.withdraw(10)}.to raise_error message
    end

    it 'should push transaction to statement' do
      account.deposit(30)
      account.withdraw(10)
      expect(account.statement.all.length).to eq 2
      expect(account.statement.all[1]).to eq @my_hash
    end
  end
end
