require 'journey'

describe Journey do
  let(:entry_station){ double :station }
  let(:exit_station){ double :station }

  it 'can start a journey' do
    expect(subject).to respond_to(:start)
  end
  it 'can log the starting station' do
    journey = Journey.new(entry_station)
    expect(journey.start).to eq entry_station
  end
  it 'can log the ending station' do
    journey = Journey.new(entry_station)
    expect(journey.end(exit_station)).to eq exit_station
  end
  it 'can log a complete journey' do
    journey = Journey.new(entry_station)
    journey.start
    journey.end(exit_station)
    expect(journey.complete?).to be_truthy
  end
  it 'can log an incomplete journey when not ended' do
    journey = Journey.new(entry_station)
    journey.start
    expect(journey.complete?).to be_falsey
  end
  it 'can log an incomplete journey when not started' do
    journey = Journey.new
    journey.end(exit_station)
    expect(journey.complete?).to be_falsey
  end
  it 'can calculate the fare for a completed journey' do
    journey = Journey.new(entry_station)
    journey.start
    journey.end(exit_station)
    expect(journey.fare).to eq(Journey::DEFAULT_MINIMUM_FARE)
  end
  it 'can calculate the fare for an incomplete journey' do
    journey = Journey.new
    journey.end(exit_station)
    expect(journey.fare).to eq(Journey::PENALTY_FARE)
  end
end
