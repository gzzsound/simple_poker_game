require 'spec_helper'

describe Models::FourOfAKind do

  it 'return self if a straight was found' do
    cards = %w(5C 5C 5C 5C 4C).map{ |v| Models::Card.new(v) }
    expect{described_class.new(cards)}.to_not raise_error
  end

  it 'return the value by the highest card' do
    cards = %w(5C 5C 5C 5C 4C).map{ |v| Models::Card.new(v) }
    point = described_class.new(cards)
    expect(point.value == 5).to be_true
  end

end