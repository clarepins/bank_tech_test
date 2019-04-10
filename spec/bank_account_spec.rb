require 'bank_account'

describe BankAccount do

  let(:date_double) { double :date }

  it 'intitializes with a balance of zero' do
    expect(subject.statement).to eq [{ balance: 0 }]
  end

  it 'deposits and date are added to statement' do
    subject.deposit(3000, date_double)
    statement = [{ balance: 0 },
                 { date: date_double, credit: 3000, balance: 3000 }]
    expect(subject.statement).to eq statement
  end

  it 'withdrawals and dates are added to statement' do
    subject.deposit(3000, date_double)
    subject.withdraw(500, date_double)
    statement = [{ balance: 0 },
                 { date: date_double, credit: 3000, balance: 3000 },
                 { date: date_double, debit: 500, balance: 2500 }]
    expect(subject.statement).to eq statement
  end

  it 'prints a formatted statement' do
    subject.deposit(3000, date_double)
    subject.withdraw(500, date_double)
    formatted_statement = 'date || credit || debit || balance
#[Double :date] || || 500.00 || 2500.00
#[Double :date] || 3000.00 || || 3000.00'
    expect(subject.print_statement).to eq formatted_statement
  end

  it 'can deal with floats' do
    subject.deposit(3.23, date_double)
    subject.withdraw(1.21, date_double)
    formatted_statement = 'date || credit || debit || balance
#[Double :date] || || 1.21 || 2.02
#[Double :date] || 3.23 || || 3.23'
    expect(subject.print_statement).to eq formatted_statement
  end
end
