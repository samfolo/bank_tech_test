require_relative 'transaction'
require_relative 'transactions'

class BankAccount
  INSUFFICIENT_FUNDS = 'This account has inufficient funds.'
  INVALID_DEPOSIT = 'Invalid deposit.'
  INVALID_WITHDRAWAL = 'Invalid withdrawal.'
  
  def initialize transaction_class = Transaction, transactions = Transactions.new
    @transactions = transactions
    @transaction_class = transaction_class
    @balance = 0
  end

  def deposit amount, date = Transaction::CURRENT_DATE
    raise INVALID_DEPOSIT if amount < 5

    @balance += amount
    at_deposit ||= @balance
    @transactions.log @transaction_class.new(amount, at_deposit, date, 'deposit')
    @balance
  end

  def withdraw amount, date = Transaction::CURRENT_DATE
    raise INSUFFICIENT_FUNDS if (@balance - amount).negative?
    raise INVALID_WITHDRAWAL if amount < 5

    @balance -= amount
    at_withdrawal ||= @balance
    @transactions.log @transaction_class.new(amount, at_withdrawal, date, 'withdrawal')
    @balance
  end

  def print_statement
    statement = "date || credit || debit || balance\n" +
    @transactions.log_data.reverse.join("\n")
    puts statement
  end
end
