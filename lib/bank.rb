require_relative 'authentication'

class Bank
  @bank_accounts = []
  @tracked_account = BankAccount.new

  def self.open_account_for name, pin_number
    authentication = Authentication.new(pin_number)
    @tracked_account = BankAccount.new(name, authentication)
    @bank_accounts << @tracked_account

    'Account opened for Sam'
  end

  def self.access_account_for name, pin_number
    target_account = @bank_accounts.find { |account| account.owner == name }
    return 'Access denied' if target_account.enter_pin(pin_number) != 'Account unlocked'
    'Account unlocked'
  end
end
