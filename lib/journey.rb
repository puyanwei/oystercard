class Journey
  attr_accessor :entry_station, :exit_station

  def initialize(entry_station, exit_station)
    @entry_station = entry_station
    @exit_station = exit_station
  end
end

# starting a journey, finishing a journey, calculating the fare of a journey, and returning whether or not the journey is complete.
