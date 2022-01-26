require 'station'

describe Station do
  
  it 'checks if name variable exists' do
    station = Station.new("Newcastle", "zone1")
    expect(station.name).to eq "Newcastle"
  end

  it 'checks if zone variable exists' do
    station = Station.new("Newcastle", "zone1")
    expect(station.zone).to eq "zone1"
  end
end 