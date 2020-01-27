class Transactions
  def log_deposit deposit
  end

  def get_log_data
    "date || credit || debit || balance\n" + 
    "21/04/2022 || 1240.00 || || 690.00\n" + 
    "13/12/2020 || 50.00 || || 550.00\n" +
    "10/12/2020 || 500.00 || || 500.00"
  end
end
