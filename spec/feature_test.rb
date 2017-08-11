require '../lib/oystercard.rb'
require '../lib/journey.rb'

test = Oystercard.new

test.touch_in("Bank")
p "journey_history has #{@current_journey}"

# touch_in("Bank")
# p "journey_history has #{@journey_history}"
