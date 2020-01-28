require 'bank_account'

RSpec.describe BankAccount do
  let(:subject) { described_class.new }

  it 'allows an owner to deposit 300 coins' do
    # returns amount deposited
    expect(subject.deposit(300)).to eq 300
  end

  it 'allows an owner to deposit 400.75 coins' do
    expect(subject.deposit(400.75)).to eq 400.75
  end

  it 'allows an owner to withdraw 15.50 coins' do
    subject.deposit(500)

    # returns amount withdrawn (negative amount)
    expect(subject.withdraw(15.5)).to eq 15.5 * -1
  end

  it 'allows an owner to withdraw 475 coins' do
    subject.deposit(500)

    expect(subject.withdraw(475)).to eq 475 * -1
  end

  it 'throws an error when owner attempts to withdraw more than is available' do
    expect { subject.withdraw(10) }.to raise_error BankAccount::INSUFFICIENT_FUNDS
  end

  it 'does not allow an account owner to deposit less than 5 coins' do
    expect { subject.deposit(4.5) }.to raise_error BankAccount::INSUFFICIENT_DEPOSIT
  end

  it 'does not allow an account owner to withdraw less than 5 coins' do
    expect { subject.deposit(4.5) }.to raise_error BankAccount::INSUFFICIENT_DEPOSIT
  end
end
