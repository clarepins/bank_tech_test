require 'statement'

describe Statement do
  it 'formats a statement' do
    statement = Statement.new([{ balance: 0 }])
    expect(statement.print).to eq 'date || credit || debit || balance'
  end

  it 'formats a statement' do
    history = [{ balance: 0 },
               { date: '01/01/2019', transaction: 3000, balance: 3000 },
               { date: '01/01/2019', transaction: -500, balance: 2500 }]
    statement = Statement.new(history)
    expect(statement.print).to eq 'date || credit || debit || balance
01/01/2019 || || 500.00 || 2500.00
01/01/2019 || 3000.00 || || 3000.00'
  end
end
