require 'transaction'

RSpec.describe Transaction do
  let(:current_balance) { 999 }
  let(:test_transaction) { Transaction.new(199, current_balance, '10/08/2024') }

  it 'takes an amount' do
    expect(test_transaction.view_amount).to eq '199.00'
  end

  it 'takes a date' do
    expect(test_transaction.date_created).to eq '10/08/2024'
  end

  context 'when no date is given' do
    it 'uses the current date' do
      no_date_transaction = described_class.new(9, current_balance)
      expect(no_date_transaction.date_created).to eq Transaction::CURRENT_DATE
    end
  end
end
