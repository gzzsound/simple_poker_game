module Models
  class Straight < Models::Point

    MAGNITUDE = 5

    def initialize(cards)
      super(cards)
      raise_not_valid_cards unless is_a_straight?
    end

    def is_a_straight?
      @cards.sort_by{|card| card.value}.each_cons(2).all? { |x,y|y.value == x.value + 1}
    end
  end
end