require 'oystercard'

describe Oystercard do
  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
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

  it 'decreases the balance by an amount' do
    subject.deduct(10)
      expect(subject.balance).to eq(-10)
  end

  it 'responds to touch in' do
    expect(subject).to respond_to(:touch_in)
  end

  it 'raises an error if balance if below £1' do
    expect { subject.touch_in }.to raise_error 'insufficient balance'
  end

  it 'responds to touch out' do
    expect(subject).to respond_to(:touch_out)
  end

  it 'shows if card is being in journey' do
    expect(subject).to respond_to(:in_journey?)
  end

  it 'changes status after touch in' do
    subject.top_up(Oystercard::DEFAULT_MINIMUM)
    subject.touch_in
    expect(subject.in_journey?).to be_truthy
  end

  it 'changes status after touch out' do
    subject.top_up(Oystercard::DEFAULT_MINIMUM)
    subject.touch_in
    subject.touch_out
    expect(subject.in_journey?).to be_falsey
  end

  it 'can be charged minimum fare' do
    subject.top_up(Oystercard::DEFAULT_MINIMUM)
    subject.touch_in
    subject.touch_out
    expect{ subject.touch_out }.to change{ subject.balance }.by(subject.balance - Oystercard::DEFAULT_MINIMUM_FARE)

  end
  end
