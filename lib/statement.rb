class Statement
  def initialize(transaction_history)
    @transaction_history = transaction_history
  end

  def print
    format_statement.prepend('date || credit || debit || balance')
  end

  private

  def format_statement
    statement_string = ''
    @transaction_history.drop(1).each do |entry|
      statement_string.prepend(format_entry(entry))
    end
    statement_string
  end

  def format_entry(e)
    return "\n" + e[:date] + format(e[:transaction]) + ' ||' + format(e[:balance]) if e[:transaction].positive?
    return "\n" + e[:date] + ' ||' + format(e[:transaction] * -1) + format(e[:balance]) if e[:transaction].negative?
  end

  def format(value)
    ' || %.2f' % value
  end
end
