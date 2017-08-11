require "journey"

describe Journey do
  it "adds an entry station" do
    journey = Journey.new("Bank", "London Bridge")
    expect(journey.entry_station).to eq("Bank")
  end

  it "adds an exit station" do
    journey = Journey.new("Bank", "London Bridge")
    expect(journey.exit_station).to eq("London Bridge")
  end
end
