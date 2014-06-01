module Models
  class Hand
    attr_accessor :cards

    def initialize(cards_representation)
      @cards = cards_representation.split(' ').map{|representation| Models::Card.new(representation) }
      raise NotValidNumberOfCardsGiven if @cards.count != 5
    end

    def to_s
      @cards.each(&:to_s).join ''
    end

    class NotValidNumberOfCardsGiven < StandardError ; end
  end
end