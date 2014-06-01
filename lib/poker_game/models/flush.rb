module Models
  class Flush < Models::Point

    MAGNITUDE = 6

    def initialize(cards)
      super(cards)
      raise_not_valid_cards unless all_cards_are_with_same_suite?
    end

    def <=>(point)
      super(point)
      Models::HighCard.new(@cards) <=> Models::HighCard.new(point.cards)
    end

  end
end