module Models
  class Three < Models::Point

    MAGNITUDE = 4

    def initialize(cards)
      super(cards)
      @cards = get_similar_cards(3)
      raise_not_valid_cards if @cards.nil?
    end
  end
end