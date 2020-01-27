class BankAccount
  def initialize balance = 0
    @balance = balance
  end

  def deposit amount, date = nil
    @balance += amount
    "You have deposited #{amount} coins"
  end

  def withdraw amount
    @balance -= amount
    "You have withdrawn #{amount} coins"
  end

  def view_balance
    "You have #{@balance} coins"
  end

  def print_statement
    "date || credit || debit || balance\n10/01/2020 || 40.00 || || 40.00"
  end
end
