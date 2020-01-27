require_relative 'deposit'

class BankAccount
  def initialize balance = 0
    @balance = balance
    @deposits = []
  end

  def deposit amount, date = nil
    @balance += amount
    @deposits << Deposit.new(amount, date)
    "You have deposited #{'%.2f' % amount} coins"
  end

  def withdraw amount, date = nil
    @balance -= amount
    "You have withdrawn #{'%.2f' % amount} coins"
  end

  def view_balance
    "You have #{'%.2f' % @balance} coins"
  end

  def print_statement
    "date || credit || debit || balance\n" +
    @deposits.map.with_index { |deposit, i| 
      "#{deposit.date_created} || #{deposit.view_amount} || || #{balance_at(i)}"
    }.reverse.join("\n")
  end

  private

  def balance_at index
    balance = 0
    @deposits[0..index].to_a.each { |deposit| balance += deposit.view_amount.to_i }
    '%.2f' % balance
  end
end
