require_relative 'journey'

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
    @journey.start(station) # NEED TO ADD THIS
    @journey_log = {entry_station: station}
  end

  def touch_out(station)


    @journey.end(station)
    @journey_log[:exit_station] = station
     @journey_history << @journey
    charge_fare
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
