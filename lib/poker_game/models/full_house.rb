module Models
  class FullHouse < Models::Point

    MAGNITUDE = 7

    def initialize(cards)
      super(cards)
      @three =  Models::Three.new(cards)
      raise_not_valid_cards unless @three and Models::Pair.new(cards)
    end

    def value
      @three.value
    end

  end
end