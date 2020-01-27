require 'withdrawal'

RSpec.describe Withdrawal do
  let(:test_withdrawal) { Withdrawal.new(60, '10/03/2020') }
  
  it 'takes an amount' do
    expect(test_withdrawal.view_amount).to eq '60.00'
  end

  it 'takes a date' do
    expect(test_withdrawal.date_created).to eq '10/03/2020'
  end

  it 'prints its log data' do
    expect(test_withdrawal.log_line).to eq "10/03/2020 || || 60.00 ||"
  end
end
