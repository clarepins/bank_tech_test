require 'date'

class Transaction
  def initialize(value, current_balance, date = Time.new.strftime('%d/%m/%Y'))
    @value = value
    @current_balance = current_balance
    @date = date
  end

  def store
    { date: @date, transaction: @value, balance: @current_balance + @value }
  end
end
