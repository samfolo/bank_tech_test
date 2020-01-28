class Transaction
  CURRENT_DATE = Time.now.utc.strftime('%d/%m/%Y')

  def initialize amount, logged_balance, date = nil, type
    @amount = amount
    @date = date || CURRENT_DATE
    @logged_balance = logged_balance
    @type = type
  end

  def date_created
    @date
  end

  def log_line
    @type == 'deposit' ?
    "#{date_created} || #{view_amount} || || #{'%.2f' % @logged_balance}" :
    "#{date_created} || || #{view_amount} || #{'%.2f' % @logged_balance}"
  end
  
  private

  def view_amount
    '%.2f' % @amount
  end
end
