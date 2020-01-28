# require 'transactions'

# RSpec.describe Transactions do
#   let(:test_transctions) { Transactions.new }

#   let(:deposit_one) { double(:deposit, log_line: '10/12/2020 || 500.00 || || 500.00') }
#   let(:deposit_two) { double(:deposit, log_line: '13/12/2020 || 50.00 || || 550.00') }
#   let(:deposit_three) { double(:deposit, log_line: '21/04/2022 || 690.00 || || 1240.00') }

#   let(:withdrawal_one) { double(:withdrawal, log_line: '11/12/2020 || 40.00 || || 460.00') }
#   let(:withdrawal_two) { double(:withdrawal, log_line: '12/12/2020 || 50.00 || || 410.00') }
#   let(:withdrawal_three) { double(:withdrawal, log_line: '24/04/2022 || 10.00 || || 400.00') }

#   it 'can return data for three seperate deposits' do
#     test_transctions.log(deposit_one)
#     test_transctions.log(deposit_two)
#     test_transctions.log(deposit_three)

#     expected_log = ["10/12/2020 || 500.00 || || 500.00", "13/12/2020 || 50.00 || || 550.00", "21/04/2022 || 690.00 || || 1240.00"]
#     expect(test_transctions.log_data).to eq expected_log
#   end

#   it 'can return data for three seperate withdrawals' do
#     test_transctions.log(withdrawal_one)
#     test_transctions.log(withdrawal_two)
#     test_transctions.log(withdrawal_three)

#     expected_log = ['11/12/2020 || 40.00 || || 460.00', '12/12/2020 || 50.00 || || 410.00', '24/04/2022 || 10.00 || || 400.00']
#     expect(test_transctions.log_data).to eq expected_log
#   end

#   it 'can return data for two seperate withdrawals and one deposit' do
#     test_transctions.log(deposit_one)
#     test_transctions.log(withdrawal_one)
#     test_transctions.log(withdrawal_two)

#     expected_log = ['10/12/2020 || 500.00 || || 500.00', '11/12/2020 || 40.00 || || 460.00', '12/12/2020 || 50.00 || || 410.00']
#     expect(test_transctions.log_data).to eq expected_log
#   end
# end
