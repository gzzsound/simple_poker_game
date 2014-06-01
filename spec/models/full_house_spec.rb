require 'spec_helper'

describe Models::FullHouse do

  it 'return self if a straight was found' do
    cards = %w(5C 5C 5C 3C 3C).map{ |v| Models::Card.new(v) }
    expect{described_class.new(cards)}.to_not raise_error
  end

end