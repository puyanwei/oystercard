require "oystercard"

describe Oystercard do

  let(:entry) {double("entry")}
  let(:exit) {double("exit")}


  describe "#top_up" do
    it "default balance of zero" do
      new_card = Oystercard.new
      expect(new_card.balance).to eq 0
    end

    it "can be topped up" do
      subject.top_up 10
      expect(subject.balance).to eq 10
    end

    it "has a max balance of 90" do
      expect(subject.limit).to eq 90
    end

    it "raises error when topping up over limit" do
      subject.top_up 90
      expect { subject.top_up 10 } .to raise_error "Top-up limit of #{subject.limit} reached"
    end
  end

  describe "#deduct" do
    it "deducts money when taking journey" do
      subject.top_up 30
      subject.touch_in(entry)
      subject.touch_out(exit)
      expect(subject.balance).to eq 29
    end
  end

  describe "#in_journey?" do
    it "begins journey when touching in" do
      subject.top_up(10)
      subject.touch_in(entry)
      expect(subject).to be_in_journey
    end

    it "ends journey when touching out" do
      subject.top_up(10)
      subject.touch_in(entry)
      subject.touch_out(exit)
      expect(subject).not_to be_in_journey
    end
  end

  it "raises error if insufficient funds" do
    expect { subject.touch_in(entry) }.to raise_error "Insufficient funds"
  end

  it "touch out deducts minimum fare from balance" do
    subject.top_up(3)
    subject.touch_in(entry)
    expect { subject.touch_out(exit) }.to change { subject.balance }.by(-1)
  end

  it "remembers the entry station after touching in" do
    subject.top_up(3)
    expect{ subject.touch_in(entry) }.to change{ subject.journey_history.size }.by(1)
  end

  it "journey_history is an empty array by default" do
    expect(subject.journey_history).to eql([])
  end

  it "stores journey in journey_history" do
    subject.top_up(5)
    subject.touch_in(entry)
    subject.touch_out(exit)
    expect(subject.journey_history.size).to eq 1
  end

  it "touching in without touching out adds current incomplete journey to the journey history"
  it "touching in without touching out deducts penalty fare from balance"
  it "touching in without touching out resets current journey"
end
