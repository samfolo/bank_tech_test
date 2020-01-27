class Deposit
  def initialize amount, balance_at_deposit = 0, date
    @amount = amount
    @date = date
    @balance_at_deposit = balance_at_deposit
  end

  def view_amount
    '%.2f' % @amount
  end

  def date_created
    @date
  end

  def log_line
    "#{date_created} || #{view_amount} || || #{'%.2f' % @balance_at_deposit}"
  end
end
