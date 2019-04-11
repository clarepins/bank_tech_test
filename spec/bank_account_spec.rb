require 'bank_account'

describe BankAccount do

  before(:each) do
    @transaction_history = [{ balance: 0 },
                            { date: '01/01/2019', transaction: 3000, balance: 3000 }]
  end

  it 'intitializes with a balance of zero' do
    expect(subject.transaction_history).to eq [{ balance: 0 }]
  end

  it 'can instantiate a new transaction and store it' do
    transaction_double = double(:transaction)
    transaction_instance = double(:transaction_instance)
    stored_transaction = { date: '01/01/2019', transaction: 3000, balance: 3000 }
    allow(transaction_double).to receive(:new).with(3000, 0).and_return(transaction_instance)
    allow(transaction_instance).to receive(:store_transaction).and_return(stored_transaction)
    expect(subject.add_transaction(3000, transaction_double)).to eq @transaction_history
  end

  it 'can instantiate a new transaction and store it' do
    statement_double = double(:statement)
    statement_instance = double(:statement_instance)
    printed_statement = 'date || credit || debit || balance
01/01/2019 || 3000.00 || || 3000.00'
    allow(statement_double).to receive(:new).and_return(statement_instance)
    allow(statement_instance).to receive(:print).and_return(printed_statement)
    expect(subject.print_statement(statement_double)).to eq printed_statement
  end

end
