require 'bank'

RSpec.describe Bank do
  it 'lets a customer open a bank account' do
    expect(Bank.open_account_for('Sam', 1234)).to eq 'Account opened for Sam'
  end

  describe 'an existing account' do
    before(:each) do
      Bank.open_account_for('Elodie', 1234)
    end

    it 'lets a customer access their account' do
      expect(Bank.access_account_for('Elodie', 1234)).to eq 'Account unlocked'
    end
    
    it 'denies a customer acces to their account if the PIN number is incorrect' do
      expect(Bank.access_account_for('Elodie', 1246)).to eq 'Access denied'
    end
  end
end
