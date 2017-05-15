require 'app/statement'

describe Statement do
  subject(:statement) {described_class.new}

  describe 'init' do
    it 'should start with an empty array' do
      expect(statement.all).to eq []
    end
  end

  describe '#add_transaction' do
    it 'should add object to all array' do
      statement.add_transaction("Hello")
      expect(statement.all.length).to eq 1
      expect(statement.all[0]).to eq "Hello"
    end
  end

  describe '#format_transactions' do
    before do
      @my_hash = {
        date: Time.now.strftime("%d/%m/%Y"),
        type: "Withdrawal",
        amount: "%.2f" % 10,
        balance: "%.2f" % 20
      }
    end
    it 'should format the transaction' do
      statement.add_transaction(@my_hash)
      expect(statement.print_statement).to include "#{Time.now.strftime("%d/%m/%Y")} || £10.00 || Withdrawal || £20.00"
    end
  end
end
