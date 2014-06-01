require 'spec_helper'

describe Models::Straight do

  it 'return self if a straight was found' do
    cards = %w(5C 6C 2C 3C 4C).map{ |v| Models::Card.new(v) }
    expect{described_class.new(cards)}.to_not raise_exception
  end

end
