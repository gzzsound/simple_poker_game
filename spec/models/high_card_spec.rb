require 'spec_helper'

describe Models::HighCard do

  context 'comparison between two points' do
    it 'compare cards based on single value' do
      low_cards = %w(7C 6C 2C 3C 2C).map{ |v| Models::Card.new(v) }
      high_cards = %w(7C 6C 2C 3C 4C).map{ |v| Models::Card.new(v) }
      expect(Models::HighCard.new(high_cards) <=> Models::HighCard.new(low_cards)).to be == 1
    end
  end

end
