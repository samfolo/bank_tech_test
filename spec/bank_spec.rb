require 'bank'

RSpec.describe Bank do
  let(:test_bank) { Bank.new }

  it 'lets a customer open a bank account' do
    expect(test_bank.open_account_for('Sam', 1234)).to eq 'Account opened for Sam'
  end

  it 'lets a customer access their account' do
    test_bank.open_account_for('Elodie', 1234)
    expect(test_bank.access_account_for('Elodie', 1234)).to eq 'Account unlocked'
  end
end
