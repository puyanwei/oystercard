require "oystercard"

describe Oystercard do

  describe "#top_up" do
    it "Default balance of zero" do
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
      expect(subject.touch_out).to eq 29
    end
  end

  describe "#in_journey?" do
    it "begins journey when touching in" do
      subject.top_up(10)
      subject.touch_in
      expect(subject).to be_in_journey
    end

    it "ends journey when touching out" do
      subject.top_up(10)
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
  end

  it "raises error if insufficient funds" do
    expect { subject.touch_in }.to raise_error "Insufficient funds"
  end

  it "touch out deducts minimum fare from balance" do
    subject.top_up(3)
    subject.touch_in
    expect { subject.touch_out }.to change { subject.balance }.by(-1)
  end
end
