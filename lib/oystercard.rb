class Oystercard
  DEFAULT_MAXIMUM = 90
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    @balance += amount
    fail 'TOO MUCH MONEY, MAX IS 90' if @balance > DEFAULT_MAXIMUM
    @balance
  end
end
