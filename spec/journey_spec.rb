require 'journey'

describe Journey do

  let(:entry_station) { double :station}
  let(:exit_station) { double :station}

  it 'defaults entry to nil' do
    expect(subject.entry).to eq(nil)
  end

  it 'defaults exit to nil' do
    expect(subject.exit).to eq(nil)
  end
  
  it "knows if a journey is not complete" do
    expect(subject).not_to be_complete
  end

  it "returns itself when exiting a journey" do
    expect(subject.finish(exit_station)).to eq(exit_station)
  end
  
  it "returns itself when exiting a journey" do
    expect(subject.start(entry_station)).to eq(entry_station)
  end

  it 'has a penalty fare by default' do
    expect(subject.fare).to eq Journey::PENALTY_FARE
  end
end



