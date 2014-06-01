require 'spec_helper'

describe Models::Three do

  it 'return self if a straight was found' do
    cards = %w(5C 5C 5C 3C 4C).map{ |v| Models::Card.new(v) }
    expect{described_class.new(cards)}.not_to raise_exception
  end

end