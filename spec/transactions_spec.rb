require 'transactions'

RSpec.describe Transactions do
  let(:test_transctions) { Transactions.new }
  let(:deposit_one) { double(:deposit, log_line: '10/12/2020 || 500.00 || ||') }
  let(:deposit_two) { double(:deposit, log_line: '13/12/2020 || 50.00 || ||') }
  let(:deposit_three) { double(:deposit, log_line: '21/04/2022 || 690.00 || ||') }

  before do
    test_transctions.log_deposit(deposit_one)
    test_transctions.log_deposit(deposit_two)
    test_transctions.log_deposit(deposit_three)
  end

  it 'can return a bank statement consisting of three seperate deposits' do
    expected_log = ["21/04/2022 || 690.00 || ||", "13/12/2020 || 50.00 || ||", "10/12/2020 || 500.00 || ||"]

    expect(test_transctions.get_log_data).to eq expected_log
  end
end
