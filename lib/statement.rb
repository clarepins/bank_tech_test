class Statement
  def initialize(transaction_history)
    @transaction_history = transaction_history
  end

  def print
    formatted_statement = ''
    @transaction_history.drop(1).each do |entry|
      formatted_statement.prepend(format_entry(entry))
    end
    formatted_statement.prepend('date || credit || debit || balance')
  end

  private

  def format_entry(e) 
    "\n" + e[:date] + format(e[:transaction]) + ' ||' + format(e[:balance]) if e[:transaction].positive?
    "\n" + e[:date] + ' ||' + format(e[:transaction] * -1) + format(e[:balance]) if e[:transaction].negative?
  end

  def format(value)
    ' || %.2f' % value
  end
end
