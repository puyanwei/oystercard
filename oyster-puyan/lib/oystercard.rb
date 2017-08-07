class Oystercard
  DEFAULT_BALANCE = 0
  CARD_LIMIT = 90

  attr_reader :balance, :limit

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @limit = CARD_LIMIT
  end

  def top_up(amount)
    raise "Top-up limit of #{@limit} reached" if over_limit?(amount)
    @balance += amount
    @balance
  end

  def deduct(amount)
    @balance -= amount
  end

  private

  def over_limit?(amount)
    (amount + @balance) > @limit
  end
end
