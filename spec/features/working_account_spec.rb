RSpec.describe 'a working bank account', type: :feature do
  let(:test_account) { BankAccount.new }
  
  scenario 'an account owner makes a deposit of 500 coins' do
    expect(test_account.deposit(500)).to eq 500.00
  end

  scenario 'an account owner makes a withdrawal of 250 coins' do
    test_account.deposit(500)
    expect(test_account.withdraw(250)).to eq 250
  end

  scenario 'an account owner makes a deposit of 40 on 10/01/2020 and prints their statement' do
    test_account.deposit(40, '10/01/2020')
    expected_statement = "date || credit || debit || balance\n10/01/2020 || 40.00 || || 40.00"

    expect(STDOUT).to receive(:puts).with expected_statement
    test_account.print_statement
  end

  scenario 'an account owner makes a deposit of 40 on 10/01/2020, then 500 on 11/01/2020 and prints their statement' do
    test_account.deposit(40, '10/01/2020')
    test_account.deposit(500, '11/01/2020')
    expected_statement = "date || credit || debit || balance\n11/01/2020 || 500.00 || || 540.00\n10/01/2020 || 40.00 || || 40.00"

    expect(STDOUT).to receive(:puts).with expected_statement
    test_account.print_statement
  end
  
  scenario 'an account owner makes a deposit of 400 on 10/01/2020, a withdrawal of 350.50 on 14/03/2020 and prints their statement' do
    test_account.deposit(400, '10/01/2020')
    test_account.withdraw(350.5, '14/03/2020')
    expected_statement = "date || credit || debit || balance\n14/03/2020 || || 350.50 || 49.50\n10/01/2020 || 400.00 || || 400.00"

    expect(STDOUT).to receive(:puts).with expected_statement
    test_account.print_statement
  end
  
  scenario 'a client makes a deposit of 1000 on 10/01/2012 and a deposit of 2000 on 13/01/2012 ' +
  'and a withdrawal of 500 on 14-01-2012 then she prints her bank statement' do
    test_account.deposit(1000, '10/01/2012')   
    test_account.deposit(2000, '13/01/2012')   
    test_account.withdraw(500, '14/01/2012')
    
    expected_statement = "date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00"
    expect(STDOUT).to receive(:puts).with expected_statement
    test_account.print_statement
  end
end
