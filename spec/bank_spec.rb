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

  it 'raises an error if an account does not exist' do
    expect { Bank.access_account_for('Jim', 9999) }.to raise_error Bank::NON_EXISTENT_ACCOUNT
  end

  it 'keeps track of the logged in account' do
    Bank.open_account_for 'Rianne', 5678
    tracked_account = Bank.active_account
    expect(tracked_account.owner).to eq 'Rianne'
  end
end
