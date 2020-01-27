require_relative 'authentication'

class Bank
  NON_EXISTENT_ACCOUNT = 'No such accounts exist'

  @bank_accounts = []
  @account = BankAccount.new

  def self.open_account_for name, pin_number
    authentication = Authentication.new(pin_number)
    @account = BankAccount.new(name, authentication)
    @bank_accounts << @account

    'Account opened for Sam'
  end

  def self.access_account_for name, pin_number
    target_account = @bank_accounts.find { |account| account.owner == name }
    raise NON_EXISTENT_ACCOUNT unless target_account

    return 'Access denied' if target_account.enter_pin(pin_number) != 'Account unlocked'
    'Account unlocked'
  end
end
