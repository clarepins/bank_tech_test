require './lib/transaction.rb'
require './lib/statement.rb'

class BankAccount
  attr_reader :statement

  def initialize
    @statement = [{ balance: 0 }]
  end

  def new_transaction(value, transaction_class = Transaction)
    @statement << transaction_class.new(value, current_balance).store_transaction
  end

  def print_statement
    f_statement = ''
    @statement.drop(1).each do |e|
      f_entry = "\n#{e[:date]} || %.2f" % e[:transaction] + ' || || %.2f' % e[:balance] if e[:transaction].positive?
      f_entry = "\n#{e[:date]} || || %.2f" % e[:transaction] + ' || %.2f' % e[:balance] if e[:transaction].negative?
      f_statement.prepend(f_entry)
    end
    f_statement.prepend('date || credit || debit || balance')
  end

  private

  def current_balance
    @statement[@statement.length - 1][:balance]
  end
end
