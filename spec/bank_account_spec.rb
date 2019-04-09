require 'bank_account'

describe 'BankAccount' do
  before(:each) do
    @account = BankAccount.new
  end

  let(:date_double) { double :date }

  it 'intitializes with a blank statement' do
    expect(@account.statement).to eq []
  end

  it 'deposits and date are added to statement' do
    @account.deposit(1000, date_double)
    expect(@account.statement).to eq [{ date: date_double, credit: 1000 }]
  end

  it 'withdrawals and dates are added to statement' do
    @account.deposit(1000, date_double)
    @account.withdraw(500, date_double)
    expect(@account.statement).to eq [{ date: date_double, credit: 1000 },
                                      { date: date_double, debit: 500 }]
  end
end
