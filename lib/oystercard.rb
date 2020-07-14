class Oystercard

  DEFAULT_MAXIMUM = 90

  attr_reader :balance

  def initialize
    @balance = 0
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
end
