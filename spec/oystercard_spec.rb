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
  end
  end
