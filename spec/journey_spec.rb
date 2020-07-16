require 'journey'

describe Journey do
  let(:entry_station){ double :station }
  let(:exit_station){ double :station }

  it 'can start a journey' do
    expect(subject).to respond_to(:start)
  end
  it 'can log the starting station' do

    expect(subject.start(entry_station)).to eq entry_station
  end
  it 'can log the ending station' do

    expect(subject.end(exit_station)).to eq exit_station
  end
  it 'can log a complete journey' do

    subject.start(entry_station)
    subject.end(exit_station)
    expect(subject.complete?).to be_truthy
  end
  it 'can log an incomplete journey when not ended' do

    subject.start(entry_station)
    expect(subject.complete?).to be_falsey
  end
  it 'can log an incomplete journey when not started' do

    subject.end(exit_station)
    expect(subject.complete?).to be_falsey
  end
  it 'can calculate the fare for a completed journey' do

    subject.start(entry_station)
    subject.end(exit_station)
    expect(subject.fare).to eq(Journey::DEFAULT_MINIMUM_FARE)
  end
  it 'can calculate the fare for an incomplete journey' do
    journey = Journey.new
    journey.end(exit_station)
    expect(journey.fare).to eq(Journey::PENALTY_FARE)
  end
end
