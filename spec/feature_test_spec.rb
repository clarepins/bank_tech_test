require 'bank_account'

describe 'user interacts with bank account' do
  let(:date_double) { double :date }

  it 'a user carries out a transaction and can print statement' do
    date_today = Time.new.strftime('%d/%m/%Y')
    printed_statement = "date || credit || debit || balance
#{date_today} || || 500.00 || 2500.00
#{date_today} || 2000.00 || || 3000.00
#{date_today} || 1000.00 || || 1000.00"

    account = BankAccount.new
    account.add_transaction(1000)
    account.add_transaction(2000)
    account.add_transaction(-500)
    expect(account.print_statement).to eq printed_statement
  end
end
