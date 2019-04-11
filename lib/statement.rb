class Statement

  def print(statement)
    formatted_statement = ''
    statement.drop(1).each do |e|
      f_entry = "\n#{e[:date]} || %.2f" % e[:transaction] + ' || || %.2f' % e[:balance] if e[:transaction].positive?
      f_entry = "\n#{e[:date]} || || %.2f" % (e[:transaction] * -1) + ' || %.2f' % e[:balance] if e[:transaction].negative?
      formatted_statement.prepend(f_entry)
    end
    formatted_statement.prepend('date || credit || debit || balance')
  end
end
