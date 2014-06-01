require 'spec_helper'

describe Models::Hand do

  it 'populate cards by a string' do
    hand = described_class.new '2C TD 3H 8S KH'
    expect(hand.cards.count == 5).to be_true
  end

  it 'raise an exception if more or less of 5 cards are provided' do
    expect{described_class.new('2C')}.to raise_error Models::Hand::NotValidNumberOfCardsGiven
  end

end