module Models
  class Card
    include Comparable

    SUITS = %w(C D H S)
    SCORES = %w(2 3 4 5 6 7 8 9 T J Q K A)

    attr_accessor :value, :score, :suit

    def initialize(card_representation)
      @score, @suit = card_representation.split('')
      raise NotValidSuite unless SUITS.include? @suit
      raise NotValidValue unless SCORES.include? @score
      @value = SCORES.index(@score)+2 #for matching the real value
    end

    def <=>(card)
      @value <=> card.value
    end

    def to_s
      "#{@score}#{@suit}"
    end

    class NotValidSuite < StandardError ; end
    class NotValidValue < StandardError ; end

  end
end