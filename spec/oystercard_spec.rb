require 'oystercard'

describe Oystercard do

  let(:entry_station){ double :station }
  let(:exit_station){ double :station }

  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end
  it 'has a list of journeys' do
    expect(subject.journey_history).to eq([])
  end

  it 'can store a journey' do
    journey_count = subject.journey_history.length
    subject.top_up(Oystercard::DEFAULT_MINIMUM)
    subject.touch_in(:station)
    subject.touch_out(:station)
    expect(subject.journey_history.length).to eq(journey_count + 1)
  end

  describe '#top_up' do
    it {is_expected.to respond_to(:top_up).with(1).argument }
    it 'increases the balance with the amount of topup' do
      subject.top_up(10)
        expect(subject.balance).to eq(10)
    end

    it 'limits balance' do
      expect {subject.top_up(91) }.to raise_error "TOO MUCH MONEY, MAX IS #{Oystercard::DEFAULT_MAXIMUM}"
      end
    end

  it 'responds to touch in' do
    subject.top_up(10)
    expect(subject).to respond_to(:touch_in).with(1).argument
  end

  it 'raises an error if balance if below £1' do
    expect { subject.touch_in(:station) }.to raise_error 'insufficient balance'
  end

  it 'responds to touch out' do
    expect(subject).to respond_to(:touch_out)
  end

  it 'shows if card is being in journey' do
    expect(subject).to respond_to(:in_journey?)
  end

  it 'changes status after touch in' do
    subject.top_up(Oystercard::DEFAULT_MINIMUM)
    subject.touch_in(:station)
    expect(subject.in_journey?).to be_truthy
  end

  it 'changes status after touch out' do
    subject.top_up(Oystercard::DEFAULT_MINIMUM)
    subject.touch_in(:station)
    subject.touch_out(:station)
    expect(subject.in_journey?).to be_falsey
  end

  it 'can be charged minimum fare' do
    subject.top_up(Oystercard::DEFAULT_MINIMUM)
    subject.touch_in(:station)
    subject.touch_out(:station)
    expect{ subject.touch_out(:station) }.to change{ subject.balance }.by(- Oystercard::DEFAULT_MINIMUM_FARE)
  end

    it 'stores the entry station' do
      subject.top_up(Oystercard::DEFAULT_MINIMUM)
      subject.touch_in(entry_station)
      expect(subject.entry_station).to eq entry_station
    end
    it 'forgets the entry station after touch out' do
      subject.top_up(Oystercard::DEFAULT_MINIMUM)
      subject.touch_in(:station)
      subject.touch_out(:station)
      expect(subject.entry_station).to be_nil
    end

    it 'stores the exit station' do
      subject.top_up(Oystercard::DEFAULT_MINIMUM)
      subject.touch_in(:station)
      subject.touch_out(exit_station)
      expect(subject.exit_station).to eq exit_station
    end
  end
