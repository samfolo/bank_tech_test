require 'bank'

RSpec.describe Bank do
  let(:test_bank) { Bank.new }
  
  it 'lets a customer open a bank account' do
    expect(test_bank.open_account_for('Sam', 1234)).to eq 'Account opened for Sam'
  end
end
