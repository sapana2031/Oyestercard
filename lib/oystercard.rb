class Oystercard
  attr_reader :balance, :entry_station, :exit_station

  MAX_LIMIT = 90       
  MIN_LIMIT = 1
  
  def initialize
    @balance = 0
    @journey_history = []
  end
  
  def top_up(amount)
    @balance += amount
    fail "Overlimit: Limit is £#{MAX_LIMIT}" if @balance > MAX_LIMIT
  end

  private def deduct(amount)
    @balance -= amount  
  end

  def touch_in(entry_station)
    fail "No balance: Minimum £#{MIN_LIMIT}" if @balance < MIN_LIMIT
    @entry_station = entry_station
    
  end

  def touch_out(entry_station)
    deduct(MIN_LIMIT)
    @entry_station = nil
  end
end 