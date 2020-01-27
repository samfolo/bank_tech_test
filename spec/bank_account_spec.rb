require 'bank_account'

RSpec.describe BankAccount do
  it 'allows an owner to deposit coins' do
    expect(subject.deposit(300)).to eq 'You have deposited 300 coins'
  end

  it 'allows an owner to withdraw coins' do
    test_account = described_class.new
    test_account.deposit(500)

    expect(subject.withdraw(400)).to eq 'You have withdrawn 400 coins'
  end
end
