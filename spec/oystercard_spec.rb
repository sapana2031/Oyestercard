require 'oystercard'

describe Oystercard do
  let(:entry_station) { double :station}
  let(:exit_station) { double :station}
  

  it 'can show balance' do
   expect(subject.balance).to eq 0
  end

  it 'top up balance' do
    subject.top_up(10)
    expect(subject.balance).to eq 10 
  end

  it 'can not  go overlimit' do
    expect{subject.top_up(100)}.to raise_error 'Overlimit: Limit is £90'
  end

  it 'should have minimum balance' do
    expect{subject.touch_in(entry_station)}.to raise_error 'No balance: Minimum £1'
  end

  it 'correct amount deducted from my card' do
    subject.top_up(20)
    subject.touch_in(entry_station)
    expect {subject.touch_out(exit_station)}.to change{subject.balance}.by(-1)
  end

  it 'checks that card has empty list of journey' do
    expect(subject.journey_history).to be_empty
  end

  it 'checks that touching in and out creates journey' do
    subject.top_up(20)
    subject.touch_in(entry_station) 
    subject.touch_out(exit_station) 
    expect(subject.journey_history).to include({:entry => entry_station, :exit => exit_station})
  end

end