require_relative 'transaction'

class Withdrawal < Transaction
  def initialize amount, logged_balance = 0, date = CURRENT_DATE
    super(amount, logged_balance, date)
  end

  def log_line
    "#{date_created} || || #{view_amount} || #{'%.2f' % @logged_balance}"
  end
end
