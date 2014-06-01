require 'spec_helper'

describe Models::Pair do

  it 'return self if a straight was found' do
    cards = %w(5C 5C 2C 3C 4C).map{ |v| Models::Card.new(v) }
    point = described_class.new(cards)
    expect(point.class == Models::Pair).to be_true
  end

  context 'comparison between two points' do
    it 'compare cards based on single value' do
      low_cards = %w(2C 2C 4C 6C 7C).map{ |v| Models::Card.new(v) }
      high_cards = %w(2C 2C 5C 6C 7C).map{ |v| Models::Card.new(v) }
      high_hand = Models::Pair.new(high_cards)
      low_hand = Models::Pair.new(low_cards)
      expect(high_hand <=> low_hand).to be == 1
    end
  end

end