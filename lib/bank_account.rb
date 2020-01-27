require_relative 'deposit'

class BankAccount
  def initialize balance = 0
    @balance = balance
    @deposits = []
  end

  def deposit amount, date = nil
    @balance += amount
    @deposits << Deposit.new(amount, date)
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
    "date || credit || debit || balance\n" +
    @deposits.map { |deposit| "#{deposit.date_created} || #{'%.2f' % deposit.view_amount} || || #{'%.2f' % @balance}" }.join("\n")
  end
end
