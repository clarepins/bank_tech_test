require 'transaction'

describe Transaction do

  let(:date_double) { double :date }

  it 'can store a transaction in account.statement' do
    t = Transaction.new(3000, 0, date_double)
    expect(t.calc_balance).to eq ({ date: date_double, transaction: 3000,  balance: 3000 })
  end
end
