require 'spec_helper'

describe Models::StraightFlush do

  it 'return self if a straight was found' do
    cards = %w(5C 6C 2C 3C 4C).map{ |v| Models::Card.new(v) }
    expect{described_class.new(cards)}.to be_true
  end

  it 'know how to compare points' do
    l_cards = %w(5C 6C 2C 3C 4C).map{ |v| Models::Card.new(v) }
    h_cards = %w(3C 4C 5C 6C 7C).map{ |v| Models::Card.new(v) }
    l_point = described_class.new(l_cards)
    h_point = described_class.new(h_cards)
    expect(l_point < h_point).to be_true
    expect(h_point > l_point).to be_true
  end

end
