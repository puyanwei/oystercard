require 'oystercard'

describe Oystercard do
  it 'Default balance of zero' do
    new_card = Oystercard.new
    expect(new_card.balance).to eq(0)
  end
end
