class Withdrawal
  def initialize amount, date, balance_at_withdrawal
    @amount = amount
    @date = date
    @balance_at_withdrawal = balance_at_withdrawal
  end

  def view_amount
    '%.2f' % @amount
  end

  def date_created
    @date
  end

  def log_line
    "#{date_created} || || #{view_amount} || #{'%.2f' % @balance_at_withdrawal}"
  end
end
