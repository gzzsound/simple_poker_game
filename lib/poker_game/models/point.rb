module Models
  class Point
    include Comparable

    attr_accessor :cards

    def initialize(cards)
      @cards = cards
      @grouped_cards = @cards.group_by{ |card| card.value }
    end

    def all_cards_are_with_same_suite?
      @cards.each_cons(2).all? { |x,y| y.suit == x.suit }
    end

    def get_similar_cards(number_of_similar_cards=2)
      catch :found do
        @grouped_cards.values.each do |cards|
          if cards.count == number_of_similar_cards
            throw :found, cards
          end
        end
        nil
      end
    end


    def <=>(point)
      order = self.class::MAGNITUDE <=> point.class::MAGNITUDE
      return order if order != 0
      self.value <=> point.value
    end

    def value
      @cards.sort_by{|card| card.value}.first.value
    end

    def raise_not_valid_cards
      raise Models::Point::NotValidPoint
    end

    class NotValidPoint < StandardError ; end

  end
end