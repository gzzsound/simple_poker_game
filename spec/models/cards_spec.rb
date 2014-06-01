require 'spec_helper'

describe Models::Card do

  it 'has a valid string representation' do
    card_representation = '2C'
    expect(described_class.new(card_representation).to_s).to be == card_representation
  end

  it 'can compare card values' do
    low_card = described_class.new('2C')
    high_card = described_class.new('TC')
    expect(low_card < high_card).to be == true
    expect(high_card > low_card).to be == true
  end

  it 'return a numberic value based on score' do
    expect(described_class.new('2C').value == 2).to be_true
  end

  it 'raise and error if a not valid suit is provided' do
    expect{described_class.new('1O')}.to raise_error Models::Card::NotValidSuite
  end

  it 'raise and error if a not valid value is provided' do
    expect{described_class.new('1C')}.to raise_error Models::Card::NotValidValue
  end


end