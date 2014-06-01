module Models
  class FourOfAKind < Models::Point

    MAGNITUDE = 8

    def initialize(cards)
      super(cards)
      @cards = get_similar_cards(4)
      raise_not_valid_cards if @cards.nil?
    end

  end
end