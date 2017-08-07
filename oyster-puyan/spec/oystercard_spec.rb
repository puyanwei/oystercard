require 'oystercard'

describe Oystercard do
  it 'Default balance of zero' do
    new_card = Oystercard.new
    expect(new_card.balance).to eq 0
  end

  it 'can be topped up' do
    subject.top_up(10)
    expect(subject.balance).to eq 10
  end
end
