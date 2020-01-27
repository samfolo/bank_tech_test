require 'bank_account'

RSpec.describe BankAccount do
  it 'allows an owner to deposit coins' do
    expect(subject.deposit(300)).to eq 'You have deposited 300 coins'
  end
end
