# Example 1
## RSpec passes, but only 8 tests! Okay grouping
## Rubocop no offenses
## 100% coverage

### GOOD QUAL

# Example 2
## RSpec 1 failure on 18 tests, but poorly written grouping and formatting
## 5 offenses detected
## 99% Coverage

## OKAY QUAL - nope...tests don't pass!

# Example 3
## RSpec: 32 examples, all passed. Tests grouped appropriately and well-labelled
## 0 offenses on 10 files
## 100% coverage

## BEST QUAL

# Example 4
## 5% coverage, bad
## Error w/require relative so can't test properly
## No passes !!!!!!!!!!
## 115 fails in rubocop

## WORST QUAL

# Example 5
## RSpec: 19 examples, 0 failures
## 99.3% coverage
## 214 offences

# Example 6
## All passes
## 100% coverage
## No offenses

# EXAMPLES 2, 4 AND 5 NEED FIXING





new_card = Oystercard.new
expect(new_card.balance).to eq(0)


class Oyster

  attr_reader :balance

  DEFAULT_BALANCE = 0

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

end