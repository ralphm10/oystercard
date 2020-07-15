require 'station'

describe Station do

  station = Station.new('Balham',3)

  it 'displays a name' do
    expect(station.name).to eq('Balham')
  end
  it 'displays a zone' do
    expect(station.zone).to eq(3)
  end
end
