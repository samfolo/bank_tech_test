class Withdrawal
  def initialize amount, date
    @amount = amount
    @date = date
  end

  def view_amount
    '%.2f' % @amount
  end

  def date_created
    @date
  end
end
