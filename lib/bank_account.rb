require 'date'

class BankAccount
  attr_reader :statement

  def initialize
    @statement = []
  end

  def deposit(value, date = Time.new.strftime('%d/%m/%Y'))
    @statement << { date: date, credit: value }
  end

  def withdraw(value, date = Time.new.strftime('%d/%m/%Y'))
    @statement << { date: date, debit: value }
  end
end
