module Models
  class StraightFlush < Models::Straight

    MAGNITUDE = 8

    def initialize(cards)
      super(cards)
      raise_not_valid_cards unless is_a_straight? and all_cards_are_with_same_suite?
    end
  end
end