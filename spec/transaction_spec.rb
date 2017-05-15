require 'app/transaction'

describe 'Transaction' do
  # subject(:transaction) {described_class.new}

  describe '#make_transaction' do

    my_hash = {
      date: Time.now.strftime("%d/%m/%Y"),
      type: "Withdrawal",
      amount: 20,
      balance: 20
    }


    it 'should make a transaction upon initialize' do
      expect(Transaction.create(20, "Withdrawal", 20)).to eq my_hash
    end
  end

end
