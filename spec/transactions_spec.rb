require 'transactions'

RSpec.describe Transactions do
  let(:test_transctions) { Transactions.new }
  let(:deposit_one) { double(:deposit, view_amount: '500.00', date_created: '10/12/2020') }
  let(:deposit_two) { double(:deposit, view_amount: '50.00', date_created: '13/12/2020') }
  let(:deposit_three) { double(:deposit, view_amount: '690.00', date_created: '21/04/2022') }

  before do
    test_transctions.log_deposit(deposit_one)
    test_transctions.log_deposit(deposit_two)
    test_transctions.log_deposit(deposit_three)
  end

  it 'can return a bank statement consisting of three seperate deposits' do
    expected_statement = "" + 
    "date || credit || debit || balance\n" + 
    "21/04/2022 || 1240.00 || || 690.00\n" + 
    "13/12/2020 || 50.00 || || 550.00\n" +
    "10/12/2020 || 500.00 || || 500.00"

    expect(test_transctions.get_log_data).to eq expected_statement
  end
end
