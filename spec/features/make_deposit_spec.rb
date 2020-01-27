RSpec.describe 'making a deposit', type: :feature do
  scenario 'an account owner makes a deposit of 500 coins' do
    test_account = BankAccount.new
    
    expect(test_account.deposit(500)).to eq 'You have deposited 500 coins'
  end
end
