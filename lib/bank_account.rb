require 'date'
require 'transaction'

class BankAccount
  attr_reader :statement

  def initialize
    @statement = [{ balance: 0 }]
  end

  def new_transaction(value, transaction_class = Transaction)
    @statement << transaction_class.new(value, find_balance).calc_balance
  end

  def deposit(value, date = Time.new.strftime('%d/%m/%Y'))
    @statement << { date: date, credit: value, balance: find_balance + value }
  end

  def withdraw(value, date = Time.new.strftime('%d/%m/%Y'))
    @statement << { date: date, debit: value, balance: find_balance - value  }
  end

  def print_statement
    f_statement = ''
    @statement.drop(1).each do |e|
      f_entry = "\n#{e[:date]} || %.2f" % e[:credit] + ' || || %.2f' % e[:balance] if e.key?(:credit)
      f_entry = "\n#{e[:date]} || || %.2f" % e[:debit] + ' || %.2f' % e[:balance] if e.key?(:debit)
      f_statement.prepend(f_entry)
    end
    f_statement.prepend('date || credit || debit || balance')
  end

  private

  def find_balance
    @statement[@statement.length - 1][:balance]
  end
end
