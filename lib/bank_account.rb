require './lib/transaction.rb'
require './lib/statement.rb'

class BankAccount
  attr_reader :transaction_history

  def initialize
    @transaction_history = [{ balance: 0 }]
  end

  def add_transaction(value, transaction_class = Transaction)
    @transaction_history << transaction_class.new(value, current_balance).store_transaction
  end

  def print_statement(statement_class = Statement)
    statement_class.new(@transaction_history).print
  end

  private

  def current_balance
    @transaction_history[@transaction_history.length - 1][:balance]
  end
end
