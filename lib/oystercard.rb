class Oystercard

  DEFAULT_MAXIMUM = 90


  attr_reader :balance, :in_use

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(amount)
    @balance += amount
    fail "TOO MUCH MONEY, MAX IS #{DEFAULT_MAXIMUM}" if @balance > DEFAULT_MAXIMUM
    @balance
  end

  def deduct(amount)
    @balance -= amount
    @balance
  end

  def touch_in
    @in_use = true
  end

  def touch_out
    @in_use = false
  end

  def in_journey?
    @in_use
  end
end
