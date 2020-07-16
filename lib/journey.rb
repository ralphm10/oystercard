class Journey

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
    complete? ? 1 : 6
  end

end
