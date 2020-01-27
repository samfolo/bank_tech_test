RSpec.describe 'a working bank account', type: :feature do
  let(:test_account) { BankAccount.new }

  scenario 'an account owner makes a deposit of 500 coins' do
    expect(test_account.deposit(500)).to eq 'You have deposited 500 coins'
  end

  scenario 'an account owner makes a withdrawal of 250 coins' do
    test_account.deposit(500)
    expect(test_account.withdraw(250)).to eq 'You have withdrawn 250 coins'
  end

  scenario 'an account owner makes a deposit of 500, withdraws 30 and wants to see their balance' do
    test_account.deposit(500)
    test_account.withdraw(30)
    expect(test_account.view_balance).to eq 'You have 470 coins'
  end

  scenario 'an account owner makes a deposit of 40 on 10/01/2020 and prints their statement' do
    test_account.deposit(40, '10/01/2020')
    expected_statement = "date || credit || debit || balance\n10/01/2020 || 40.00 || || 40.00"

    expect(test_account.print_statement).to eq expected_statement
  end
end