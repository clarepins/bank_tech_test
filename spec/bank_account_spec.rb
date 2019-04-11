require 'bank_account'

describe BankAccount do

  it 'intitializes with a balance of zero' do
    expect(subject.statement).to eq [{ balance: 0 }]
  end

  it 'can instantiate a new transaction and store it' do
    transaction_double = double(:transaction)
    transaction_instance = double(:transaction_instance)
    transaction_calc_balance = double ({ date: '01/01/2019', transaction: 3000, balance: 3000 })
    allow(transaction_double).to receive(:new).with(3000, 0).and_return(transaction_instance)
    allow(transaction_instance).to receive(:store_transaction).and_return(transaction_calc_balance)
    subject.new_transaction(3000, transaction_double)
  end

#   it 'prints a formatted statement' do
#     subject.new_transaction(3000, date_double)
#     subject.new_transaction(-500, date_double)
#     formatted_statement = 'date || credit || debit || balance
# #[Double :date] || || 500.00 || 2500.00
# #[Double :date] || 3000.00 || || 3000.00'
#     expect(subject.print_statement).to eq formatted_statement
#   end
#
#   it 'can deal with floats' do
#     subject.new_transaction(3.23, date_double)
#     subject.new_transaction(-1.21, date_double)
#     formatted_statement = 'date || credit || debit || balance
# #[Double :date] || || 1.21 || 2.02
# #[Double :date] || 3.23 || || 3.23'
#     expect(subject.print_statement).to eq formatted_statement
#   end
end
