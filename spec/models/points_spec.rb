require 'spec_helper'

describe Models::Point do

  it 'know how to check the suites' do
      cards = %w(5C 6C 2C 3C 4C).map{ |v| Models::Card.new(v) }
      point = described_class.new(cards)
      expect(point.all_cards_are_with_same_suite?).to be_true
  end

  it 'return nil if a group of similar cards was not found' do
    cards = %w(5C 6C 2C 3C 4C).map{ |v| Models::Card.new(v) }
    point = described_class.new(cards)
    expect(point.get_similar_cards(4)).to be_nil
  end

  it 'return a group of similar cards' do
    cards = %w(5C 5C 5C 5C 4C).map{ |v| Models::Card.new(v) }
    point = described_class.new(cards)
    expect(point.get_similar_cards(4)).not_to be_nil
  end

end
