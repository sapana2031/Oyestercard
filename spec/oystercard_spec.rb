require 'oystercard'

describe Oystercard do
  let(:entry_station) { double :station}
  

  it "can show balance" do
    oystercard = Oystercard.new
   expect(oystercard.balance).to eq 0
  end

  it "top up balance" do
    oystercard = Oystercard.new
    oystercard.top_up(10)
    expect(oystercard.balance).to eq 10 
  end

  it "can go overlimit" do
    oystercard = Oystercard.new
    expect{oystercard.top_up(100)}.to raise_error "Overlimit: Limit is £90"
  end
  # it  'can shows if its in journey' do
  #   oystercard = Oystercard.new
  #   expect(oystercard.in_journey?).to be false
  # end

  it "can touch-in" do
    oystercard = Oystercard.new
    oystercard.top_up(20)
    
    expect(oystercard.touch_in(entry_station)).to eq entry_station
  end

  it "can touch-out" do
    oystercard = Oystercard.new
    oystercard.top_up(20)
    expect(oystercard.touch_out(entry_station)).to eq nil
  end

  it "should have minimum balance" do
    oystercard = Oystercard.new
    expect{oystercard.touch_in(entry_station)}.to raise_error "No balance: Minimum £1"
  end

  it "correct amount deducted from my card" do
    oystercard = Oystercard.new
    oystercard.top_up(20)
    oystercard.touch_in(entry_station)
    expect {oystercard.touch_out(entry_station)}.to change{oystercard.balance}.by(-1)
  end
end