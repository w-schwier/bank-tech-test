require 'app/account'

describe Account do
  subject(:account) {described_class.new}

  describe '#balance' do
    it {is_expected.to respond_to :balance}

    it "should start with a balance of 0" do
      expect(account.balance).to eq 0
    end
  end

  describe '#deposit' do

    before do
      @my_hash = {
        date: Time.now.strftime("%d/%m/%Y"),
        type: "Deposit",
        amount: 10,
        balance: 10
      }
    end

    it 'should increase balance' do
      account.deposit(20)
      expect(account.balance).to eq 20
    end

    it 'should push transaction to transaction log' do
      account.deposit(10)
      expect(account.transaction_log.length).to eq 1
      expect(account.transaction_log[0]).to eq @my_hash
    end

  end

  describe '#withdraw' do

    before do
      @my_hash = {
        date: Time.now.strftime("%d/%m/%Y"),
        type: "Withdrawal",
        amount: 10,
        balance: 20
      }
    end

    it 'should decrease balance' do
      account.deposit(20)
      account.withdraw(10)
      expect(account.balance).to eq 10
    end

    it "shouldn't allow you to withdrawn if new balance < 0" do
      message = "Can't withdraw: not enough money"
      expect{account.withdraw(10)}.to raise_error message
    end

    it 'should push transaction to transaction log' do
      account.deposit(30)
      account.withdraw(10)
      expect(account.transaction_log.length).to eq 2
      expect(account.transaction_log[1]).to eq @my_hash
    end
  end
end
