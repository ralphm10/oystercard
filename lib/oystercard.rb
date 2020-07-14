class Oystercard

  DEFAULT_MAXIMUM = 90
  DEFAULT_MINIMUM = 1
  DEFAULT_MINIMUM_FARE = 1

  attr_reader :balance, :entry_station

  def initialize
    @balance = 0
    @entry_station = nil
  end

  def top_up(amount)
    @balance += amount
    fail "TOO MUCH MONEY, MAX IS #{DEFAULT_MAXIMUM}" if @balance > DEFAULT_MAXIMUM
    @balance
  end

  def touch_in(station)
    @entry_station = station
    fail "insufficient balance" if @balance < DEFAULT_MINIMUM
  end

  def touch_out
    deduct(DEFAULT_MINIMUM_FARE)
    @entry_station = nil
  end

  def in_journey?
    @entry_station != nil
  end

  private

  def deduct(amount)
    @balance -= amount
    @balance
  end

end
