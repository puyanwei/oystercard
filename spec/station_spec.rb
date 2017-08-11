require "station"

describe Station do
  it "displays its name" do
    bank = Station.new("Bank", 1)
    expect(bank.name).to eq("Bank")
  end

  it "displays its zone" do
    bank = Station.new("Bank", 1)
    expect(bank.zone).to eq(1)
  end
end
