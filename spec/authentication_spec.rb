require 'authentication'

RSpec.describe Authentication do
  let(:test_authentication) { Authentication.new(1234) }

  it 'returns true when passed the correct PIN' do
    expect(test_authentication.verify 1234).to be true
  end

  it 'returns false when passed the incorrect PIN' do
    expect(test_authentication.verify 3334).to be false
  end
end
