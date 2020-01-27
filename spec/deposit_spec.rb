require 'deposit'

RSpec.describe Deposit do
  let(:test_deposit) { Deposit.new(500, '10/01/2020') }

  it 'takes an amount' do
    expect(test_deposit.view_amount).to eq '500.00'
  end

  it 'takes a date' do
    expect(test_deposit.date_created).to eq '10/01/2020'
  end
end
