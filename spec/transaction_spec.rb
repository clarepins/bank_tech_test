require 'transaction'

describe Transaction do
  let(:date_double) { double :date }

  it 'can store a transaction and calc balance' do
    t = Transaction.new(3000, 0, date_double)
    new_transaction = { date: date_double, transaction: 3000, balance: 3000 }
    expect(t.store).to eq new_transaction
  end

  it 'can store a transaction and calc balance' do
    t = Transaction.new(-500, 3000, date_double)
    new_transaction = { date: date_double, transaction: -500, balance: 2500 }
    expect(t.store).to eq new_transaction
  end
end
