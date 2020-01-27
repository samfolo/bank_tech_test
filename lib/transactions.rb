class Transactions
  def initialize transactions = []
    @transactions = transactions
  end
  def log_deposit deposit
    @transactions << deposit
  end

  def get_log_data
    @transactions.map(&:log_line).reverse
  end
end
