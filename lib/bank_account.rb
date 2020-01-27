class BankAccount
  def initialize balance = 0
    @balance = balance
  end

  def deposit amount
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
end
