require 'withdrawal'

RSpec.describe Withdrawal do
  let(:test_withdrawal) { Withdrawal.new(60, '10/03/2020') }
  
  it 'takes an amount' do
    expect(test_withdrawal.view_amount).to eq '60.00'
  end

  it 'takes a date' do
    expect(test_withdrawal.date_created).to eq '10/03/2020'
  end
end
