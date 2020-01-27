require 'withdrawal'

RSpec.describe Withdrawal do
  let(:current_balance) { 560 }
  let(:test_withdrawal) { Withdrawal.new(60, current_balance, '10/03/2020') }
  
  it 'takes an amount' do
    expect(test_withdrawal.view_amount).to eq '60.00'
  end

  it 'takes a date' do
    expect(test_withdrawal.date_created).to eq '10/03/2020'
  end

  it 'prints its log data' do
    expect(test_withdrawal.log_line).to eq "10/03/2020 || || 60.00 || 560.00"
  end
  
  context 'when no date is given' do
    it 'uses the current date' do
      current_date = Time.now.utc.strftime '%d/%m/%Y'
      no_date_withdrawal = Withdrawal.new(60, current_balance)
      expect(no_date_withdrawal.log_line).to eq "#{current_date} || || 60.00 || 560.00"
    end
  end
end
