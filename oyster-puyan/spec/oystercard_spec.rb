require 'oystercard'

describe Oystercard do
  it 'Default balance of zero' do
    new_card = Oystercard.new
    expect(new_card.balance).to eq 0
  end

  it 'can be topped up' do
    subject.top_up 10
    expect(subject.balance).to eq 10
  end

  it 'has a max balance of 90' do
    expect(subject.limit).to eq 90
  end

  it 'raises error when topping up over limit' do
    subject.top_up 90
    expect{ subject.top_up 10 } .to raise_error "Top-up limit of #{subject.limit} reached"
  end
end
