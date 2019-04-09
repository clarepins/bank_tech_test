require 'date'

class BankAccount
  attr_reader :statement

  def initialize
    @statement = [{ balance: 0 }]
  end

  def deposit(value, date = Time.new.strftime('%d/%m/%Y'))
    @statement << { date: date, credit: value, balance: find_balance + value }
  end

  def withdraw(value, date = Time.new.strftime('%d/%m/%Y'))
    @statement << { date: date, debit: value, balance: find_balance - value  }
  end

  private
  
  def find_balance
    @statement[@statement.length - 1][:balance]
  end
end
