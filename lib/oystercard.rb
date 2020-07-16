class Oystercard

  DEFAULT_MAXIMUM = 90
  DEFAULT_MINIMUM = 1


  attr_reader :balance, :entry_station, :exit_station, :journey_history, :journey

  def initialize(journey = Journey.new)
    @balance = 0
    @journey_history = []
    @journey = journey
  end

  def top_up(amount)
    @balance += amount
    fail "TOO MUCH MONEY, MAX IS #{DEFAULT_MAXIMUM}" if @balance > DEFAULT_MAXIMUM
    @balance
  end

  def touch_in(station)
    fail "insufficient balance" if @balance < DEFAULT_MINIMUM
    # move to journey class? @journey = {entry_station: station}
  end

  def touch_out(station)
    charge_fare

    # @journey[:exit_station] = station
    # @journey_history << @journey
  end

  private

  def charge_fare
    deduct(journey.fare)
  end

  def deduct(amount)
    @balance -= amount
    @balance
  end

end
