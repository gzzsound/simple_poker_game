module Models
  class Pair < Models::Point
    MAGNITUDE = 2

    attr_accessor :remained_cards

    def initialize(cards)
      super(cards)
      pair = get_similar_cards
      raise_not_valid_cards unless pair
      @remained_cards = @cards - pair
      @cards = pair
    end

    def <=>(point)
      order = super(point)
      return order unless order == 0
      Models::HighCard.new(@remained_cards) <=> Models::HighCard.new(point.remained_cards)
    end

  end
end