class Transaction
  CURRENT_DATE = Time.now.utc.strftime('%d/%m/%Y')
  
  def initialize amount, balance_at_withdrawal, date = CURRENT_DATE
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
end
