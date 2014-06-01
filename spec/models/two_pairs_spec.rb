require 'spec_helper'

describe Models::TwoPair do
  let(:cards){ %w(5C 5C 2C 2C 4C).map{ |v| Models::Card.new(v) } }

  it 'return self if a straight was found' do
    expect{described_class.new(cards)}.not_to raise_exception
  end

  it 'return two pairs with right cards' do
    point = described_class.new(cards)
    sorted_points = point.pairs.sort

    expect(sorted_points.first.value == 2).to be_true
    expect(sorted_points.last.value == 5).to be_true
  end

  it 'return the highest value of pair' do
    point = described_class.new(cards)
    expect(point.value == 5).to be_true
  end

  context 'comparison between two pairs' do
    it 'return the point with a greater pair' do
      low_pair = %w(5C 5C 2C 2C 4C).map{ |v| Models::Card.new(v) }
      high_pair = %w(7C 7C 2C 2C 4C).map{ |v| Models::Card.new(v) }
      expect(high_pair <=> low_pair).to be == 1
    end

    it 'return the point with a greater not paired card' do
      low_pair = %w(7C 7C 2C 2C 4C).map{ |v| Models::Card.new(v) }
      high_pair = %w(7C 7C 2C 2C 8C).map{ |v| Models::Card.new(v) }
      expect(high_pair <=> low_pair).to be == 1
    end

  end

end