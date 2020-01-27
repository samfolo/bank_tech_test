require_relative 'deposit'
require_relative 'withdrawal'
require_relative 'transactions'

class BankAccount
  INSUFFICIENT_FUNDS = 'This account has inufficient funds.'

  def initialize balance = 0, transactions = Transactions.new
    @balance = balance
    @transactions = transactions
  end

  def deposit amount, balance_at_deposit = (@balance + amount), date = nil
    @balance += amount
    @transactions.log Deposit.new(amount, balance_at_deposit, date)
    "You have deposited #{'%.2f' % amount} coins"
  end

  def withdraw amount, balance_at_withdrawal = (@balance - amount), date = nil
    raise INSUFFICIENT_FUNDS if (@balance - amount).negative?

    @balance -= amount
    @transactions.log Withdrawal.new(amount, balance_at_withdrawal, date)
    "You have withdrawn #{'%.2f' % amount} coins"
  end

  def view_balance
    "You have #{'%.2f' % @balance} coins"
  end

  def print_statement
    "date || credit || debit || balance\n" +
    @transactions.log_data.reverse.join("\n")
  end
end
