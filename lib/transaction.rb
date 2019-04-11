require 'date'

class Transaction

  def initialize(value, current_balance, date = Time.new.strftime('%d/%m/%Y'))
    @value = value
    @current_balance = current_balance
    @date = date
  end

  def store_transaction
    calc_balance
    { date: @date, transaction: @value, balance: calc_balance }
  end

  private

  def calc_balance
    @current_balance + @value
  end
end
