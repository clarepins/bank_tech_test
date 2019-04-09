require 'bank_account'

describe 'BankAccount' do
  it 'intitializes with a blank statement' do
    account = BankAccount.new
    expect(account.statement).to eq []
  end
end
