require 'bank_account'

RSpec.describe BankAccount do
  let(:subject) { described_class.new(authentication) }
  let(:authentication) { double :authentication, verify: true }
  let(:false_authentication) { double :authentication, verify: false }

  before(:each) do
    subject.enter_pin 1234
  end

  it 'requires a PIN number before it can be accessed' do
    locked_account = described_class.new(false_authentication)
    expect { locked_account.deposit(30) }.to raise_error BankAccount::UNAUTHORISED
  end

  it 'can be unlocked with a PIN number' do
    new_account = described_class.new(authentication)
    expect(new_account.enter_pin 1234).to eq 'Account unlocked'
    expect(new_account.deposit 30).to eq 'You have deposited 30.00 coins'
  end

  it 'allows an owner to deposit coins' do
    expect(subject.deposit(300)).to eq 'You have deposited 300.00 coins'
  end

  it 'allows an owner to withdraw coins' do
    subject.deposit(500)

    expect(subject.withdraw(400)).to eq 'You have withdrawn 400.00 coins'
  end

  it 'allows an owner to see their current balance' do
    subject.deposit(60)
    subject.withdraw(50)

    expect(subject.view_balance).to eq 'You have 10.00 coins'
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
