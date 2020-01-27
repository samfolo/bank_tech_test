require 'bank_account'

RSpec.describe BankAccount do
  let(:test_account) { described_class.new }

  it 'allows an owner to deposit coins' do
    expect(subject.deposit(300)).to eq 'You have deposited 300 coins'
  end

  it 'allows an owner to withdraw coins' do
    test_account.deposit(500)

    expect(test_account.withdraw(400)).to eq 'You have withdrawn 400 coins'
  end

  it 'allows an owner to see their current balance' do
    test_account.deposit(60)
    test_account.withdraw(50)

    expect(test_account.view_balance).to eq 'You have 10 coins'
  end

  it 'allows an owner to see their current balance' do
    test_account.deposit(60)
    test_account.withdraw(50)

    expect(test_account.view_balance).to eq 'You have 10 coins'
  end
end
