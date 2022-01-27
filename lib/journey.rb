class Journey
    attr_accessor :entry, :exit
    PENALTY_FARE = 6
    MIN_FARE = 1
  def initialize
    @entry = nil
    @exit = nil
  end

  def fare
    self.complete? ? MIN_FARE : PENALTY_FARE
    # if self.complete? == true
    #   return MIN_FARE
    # else
    #   return PENALTY_FARE
    # end
  end

  def finish(exit_station)
    @exit = exit_station
  end

  def start(entry_station)
    @entry = entry_station
  end

  def complete?
    @entry != nil && @exit != nil ? true : false
    # if @entry != nil && @exit != nil
    #   true
    # else
    #   false
    # end
  end


end

