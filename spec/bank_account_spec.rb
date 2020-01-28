require 'bank_account'

RSpec.describe BankAccount do
  let(:test_date) { '10/01/2020' }
  let(:transaction_class) { double :transaction_class, new: true }
  let(:transactions) { double :transactions, log: true }
  let(:subject) { described_class.new transaction_class, transactions }

  it 'allows an owner to deposit 300 coins' do
    # returns amount deposited
    expect(subject.deposit(300, test_date)).to eq 300
  end

  it 'allows an owner to deposit 400.75 coins' do
    expect(subject.deposit(400.75, test_date)).to eq 400.75
  end

  it 'allows an owner to withdraw 15.50 coins' do
    subject.deposit(500, test_date)

    # returns amount withdrawn (negative amount)
    expect(subject.withdraw(50, test_date)).to eq 450
  end

  it 'allows an owner to withdraw 475 coins' do
    subject.deposit(500, test_date)

    expect(subject.withdraw(475, test_date)).to eq 25
  end

  it 'throws an error when owner attempts to withdraw more than is available' do
    expect { subject.withdraw(10, test_date) }.to raise_error BankAccount::INSUFFICIENT_FUNDS
  end

  it 'does not allow an account owner to deposit less than 5 coins' do
    expect { subject.deposit(4.5, test_date) }.to raise_error BankAccount::INVALID_DEPOSIT
  end

  it 'does not allow an account owner to withdraw less than 5 coins' do
    subject.deposit(500, test_date)

    expect { subject.withdraw(4.5, test_date) }.to raise_error BankAccount::INVALID_WITHDRAWAL
  end
end
