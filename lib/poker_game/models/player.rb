module Models
  class Player

    attr_accessor :point, :name

    def initialize(name, cards)
      @name = name
      @hand = Models::Hand.new(cards)
    end

    def play
      @point ||= Models::HandsParser.run(@hand)
    end

    def to_s
      "#{@name} -> #{@hand}"
    end

  end
end