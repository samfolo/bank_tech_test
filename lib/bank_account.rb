require_relative 'deposit'
require_relative 'withdrawal'
require_relative 'transaction'
require_relative 'transactions'

class BankAccount
  UNAUTHORISED = 'Account locked, please enter PIN number.'
  INSUFFICIENT_FUNDS = 'This account has inufficient funds.'
  INSUFFICIENT_DEPOSIT = 'Insufficient deposit.'
  INSUFFICIENT_WITHDRAWAL = 'Insufficient withdrawal.'

  attr_reader :owner
  
  def initialize(
    owner = nil,
    authentication = nil, 
    balance = 0, 
    transactions = Transactions.new, 
    locked = true,
    deposit_class = Deposit,
    withdrawal_class = Withdrawal
    )

    @owner = owner
    @authentication = authentication
    @balance = balance
    @transactions = transactions
    @locked = locked
    @deposit_class = deposit_class
    @withdrawal_class = withdrawal_class
  end

  def deposit amount, date = Transaction::CURRENT_DATE
    raise UNAUTHORISED if @locked
    raise INSUFFICIENT_DEPOSIT if amount < 5

    @balance += amount
    at_deposit ||= @balance
    @transactions.log Deposit.new(amount, at_deposit, date)
    "You have deposited #{'%.2f' % amount} coins"
  end

  def withdraw amount, date = Transaction::CURRENT_DATE
    raise UNAUTHORISED if @locked
    raise INSUFFICIENT_FUNDS if (@balance - amount).negative?
    raise INSUFFICIENT_WITHDRAWAL if amount < 5

    @balance -= amount
    at_withdrawal ||= @balance
    @transactions.log Withdrawal.new(amount, at_withdrawal, date)
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
    if @authentication.verify pin
      @locked = false
      'Account unlocked' 
    else
      'Access denied'
    end
  end
end
