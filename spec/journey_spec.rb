require 'journey'

describe Journey do
  it 'defaults entry to nil' do
    expect(subject.entry).to eq(nil)
  end

  it 'defaults exit to nil' do
    expect(subject.exit).to eq(nil)
  end
end



