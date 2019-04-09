require 'bank_account'

describe 'BankAccount' do
  before(:each) do
    @account = BankAccount.new
  end

  let(:date_double) { double :date }

  it 'intitializes with a balance of zero' do
    expect(@account.statement).to eq [{ balance: 0 }]
  end

  it 'deposits and date are added to statement' do
    @account.deposit(3000, date_double)
    statement = [{ balance: 0 },
                 { date: date_double, credit: 3000, balance: 3000 }]
    expect(@account.statement).to eq statement
  end

  it 'withdrawals and dates are added to statement' do
    @account.deposit(3000, date_double)
    @account.withdraw(500, date_double)
    statement = [{ balance: 0 },
                 { date: date_double, credit: 3000, balance: 3000 },
                 { date: date_double, debit: 500, balance: 2500 }]
    expect(@account.statement).to eq statement
  end
end
