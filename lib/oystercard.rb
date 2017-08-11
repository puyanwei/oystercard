class Oystercard
  DEFAULT_BALANCE = 5
  CARD_LIMIT = 90
  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  attr_reader :balance, :limit, :journey_history, :entry

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @limit = CARD_LIMIT
    @journey_history = []
    @current_journey = nil
  end

  def top_up(amount)
    raise "Top-up limit of #{@limit} reached" if over_limit?(amount)
    @balance += amount
  end

  def touch_in(entry_station)
    raise 'Insufficient funds' if insufficient_funds?
    in_without_out if @current_journey != nil
    @current_journey = Journey.new(entry_station, nil)
    "Touched in at #{entry_station}."
  end

  def touch_out(exit_station)
    out_without_in if @current_journey == nil
    deduct(MINIMUM_FARE)
    @current_journey.exit_station = exit_station
    @journey_history << @current_journey
    "Touched out at #{exit_station}."
  end

  def insufficient_funds?
    @balance < MINIMUM_FARE
  end

  def over_limit?(amount)
    (amount + @balance) > @limit
  end

  def in_without_out
    @journey_history << @current_journey
    @balance - PENALTY_FARE
    puts "Charged penalty fare of #{PENALTY_FARE}."
    @current_journey = nil
  end

  def out_without_in(exit_station)
    @current_journey = Journey.new(nil, exit_station)
    @journey_history << @current_journey
    @balance - PENALTY_FARE
    puts "Charged penalty fare of #{PENALTY_FARE}."
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
