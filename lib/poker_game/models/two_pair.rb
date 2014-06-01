module Models
  class TwoPair < Models::Point
    attr_accessor :pairs
    attr_accessor :remained_card

    MAGNITUDE = 3

    def initialize(cards)
      super(cards)
      @pairs = []
      @remained_card = @cards

      catch :not_found do
        2.times.each{
          pair = Models::Pair.new(@remained_card)
          throw :not_found unless pair
          @remained_card = @remained_card - pair.cards
          @pairs << pair
        }
      end
      raise_not_valid_cards unless @pairs.count == 2
    end

    def value
      @pairs.max.value
    end

    def <=>(point)
      order = super point
      return order unless order == 0
      @remained_card.max <=> point.remained_card.max
    end

  end
end