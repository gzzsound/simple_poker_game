require 'spec_helper'

describe Models::HandsParser do
  context 'point recognition' do
    it 'return straight flush' do
      hand = Models::Hand.new '2C 3C 4C 5C 6C'
      expect(Models::HandsParser.run(hand).class == Models::StraightFlush).to be_true
    end

    it 'return four of a kind' do
      hand = Models::Hand.new '2C 2C 2C 2C 6C'
      expect(Models::HandsParser.run(hand).class == Models::FourOfAKind).to be_true
    end

    it 'return full house' do
      hand = Models::Hand.new '2C 2C 2C 6C 6C'
      expect(Models::HandsParser.run(hand).class == Models::FullHouse).to be_true
    end

    it 'return flush' do
      hand = Models::Hand.new 'TC 2C 5C 6C 6C'
      expect(Models::HandsParser.run(hand).class == Models::Flush).to be_true
    end

    it 'return three of a kind' do
      hand = Models::Hand.new 'TC TS TC 5H 6C'
      expect(Models::HandsParser.run(hand).class == Models::Three).to be_true
    end

    it 'return two pairs' do
      hand = Models::Hand.new 'TC TS 9C 9H 6C'
      expect(Models::HandsParser.run(hand).class == Models::TwoPair).to be_true
    end

    it 'return pair' do
      hand = Models::Hand.new 'TC TS 8C 9H 6C'
      expect(Models::HandsParser.run(hand).class == Models::Pair).to be_true
    end

    it 'return high cards' do
      hand = Models::Hand.new '2C TS 8C 9H 6C'
      expect(Models::HandsParser.run(hand).class == Models::HighCard).to be_true
    end

  end
end