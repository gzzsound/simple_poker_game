require 'spec_helper'

describe Models::Flush do

  it 'return self if a straight was found' do
    cards = %w(5C 6C 2C 3C 4C).map{ |v| Models::Card.new(v) }
    expect{described_class.new(cards)}.not_to raise_exception
  end

  context 'comparison between two points' do
    it 'compare cards based on single value' do
      low_cards = %w(2C 4C 5C 6C 7C).map{ |v| Models::Card.new(v) }
      high_cards = %w(3C 4C 5C 6C 7C).map{ |v| Models::Card.new(v) }
      high_hand = Models::Flush.new(high_cards)
      low_hand = Models::Flush.new(low_cards)
      expect(high_hand <=> low_hand).to be == 1
    end
  end


end
