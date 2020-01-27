require_relative 'deposit'
require_relative 'withdrawal'
require_relative 'transactions'
require_relative 'authentication'

class BankAccount
  UNAUTHORISED = 'Account locked, please enter PIN number.'
  INSUFFICIENT_FUNDS = 'This account has inufficient funds.'
  INSUFFICIENT_DEPOSIT = 'Insufficient deposit.'
  INSUFFICIENT_WITHDRAWAL = 'Insufficient withdrawal.'

  def initialize authentication = Authentication.new, balance = 0, transactions = Transactions.new, locked = true
    @balance = balance
    @transactions = transactions
    @authentication = authentication
    @locked = locked
  end

  def deposit amount, balance_at_deposit = (@balance + amount), date = nil
    raise UNAUTHORISED if @locked
    raise INSUFFICIENT_DEPOSIT if amount < 5

    @balance += amount
    @transactions.log Deposit.new(amount, balance_at_deposit, date)
    "You have deposited #{'%.2f' % amount} coins"
  end

  def withdraw amount, balance_at_withdrawal = (@balance - amount), date = nil
    raise UNAUTHORISED if @locked
    raise INSUFFICIENT_FUNDS if (@balance - amount).negative?
    raise INSUFFICIENT_WITHDRAWAL if amount < 5

    @balance -= amount
    @transactions.log Withdrawal.new(amount, balance_at_withdrawal, date)
    "You have withdrawn #{'%.2f' % amount} coins"
  end

  def view_balance
    raise UNAUTHORISED if @locked

    "You have #{'%.2f' % @balance} coins"
  end

  def print_statement
    raise UNAUTHORISED if @locked

    "date || credit || debit || balance\n" +
    @transactions.log_data.reverse.join("\n")
  end

  def enter_pin pin
    @locked = false if @authentication.verify pin
    'Account unlocked'
  end
end
