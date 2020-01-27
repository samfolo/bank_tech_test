class Transaction
  CURRENT_DATE = Time.now.utc.strftime('%d/%m/%Y')

  def initialize amount, logged_balance, date = CURRENT_DATE
    @amount = amount
    @date = date
    @logged_balance = logged_balance
  end

  def view_amount
    '%.2f' % @amount
  end

  def date_created
    @date
  end
end
