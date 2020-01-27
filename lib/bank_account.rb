require_relative 'deposit'
require_relative 'withdrawal'
require_relative 'transactions'

class BankAccount
  def initialize balance = 0, transactions = Transactions.new
    @balance = balance
    @transactions = transactions
  end

  def deposit amount, date = nil, balance_at_deposit = (@balance + amount)
    @balance += amount
    @transactions.log Deposit.new(amount, date, balance_at_deposit)
    "You have deposited #{'%.2f' % amount} coins"
  end

  def withdraw amount, date = nil, balance_at_withdrawal = (@balance - amount)
    @balance -= amount
    @transactions.log Withdrawal.new(amount, date, balance_at_withdrawal)
    "You have withdrawn #{'%.2f' % amount} coins"
  end

  def view_balance
    "You have #{'%.2f' % @balance} coins"
  end

  def print_statement
    "date || credit || debit || balance\n" +
    @transactions.log_data.reverse.join("\n")
  end

  private

  def balance_at index
    
  end
end
