class Oystercard

  DEFAULT_MAXIMUM = 90
  DEFAULT_MINIMUM = 1
  DEFAULT_MINIMUM_FARE = 1

  attr_reader :balance, :entry_station, :exit_station, :journey_history, :journey

  def initialize
    @balance = 0
    @journey_history = []
    @entry_station = nil
    @exit_station = nil
  end

  def top_up(amount)
    @balance += amount
    fail "TOO MUCH MONEY, MAX IS #{DEFAULT_MAXIMUM}" if @balance > DEFAULT_MAXIMUM
    @balance
  end

  def touch_in(station)
    fail "insufficient balance" if @balance < DEFAULT_MINIMUM
    @entry_station = station
    @journey = {entry_station: station}
  end

  def touch_out(station)
    charge_fare
    @entry_station = nil
    @exit_station = station
    @journey[:exit_station] = station
    @journey_history << @journey
  end

  def in_journey?
    @entry_station != nil
  end

  private

  def charge_fare
    deduct(DEFAULT_MINIMUM_FARE)
  end

  def deduct(amount)
    @balance -= amount
    @balance
  end

end
