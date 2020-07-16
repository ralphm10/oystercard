class Journey

  DEFAULT_MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize(entry_station = nil)
    @entry_station = entry_station
  end

  def start
    @entry_station
  end

  def end(exit_station)
    @exit_station = exit_station
  end

  def complete?
    @entry_station != nil && @exit_station != nil
  end

  def fare
    complete? ? DEFAULT_MINIMUM_FARE : PENALTY_FARE
  end

end
