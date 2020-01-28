require_relative 'transaction'

class Deposit < Transaction
  def initialize amount, logged_balance = 0, date = Transaction::CURRENT_DATE
    super(amount, logged_balance)
    @date = date
  end

  def log_line 
    "#{date_created} || #{view_amount} || || #{'%.2f' % @logged_balance}"
  end
end
