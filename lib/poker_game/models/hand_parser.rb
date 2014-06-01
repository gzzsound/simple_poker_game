module Models
  class HandsParser

    def self.run(hand)
      catch :found do
        [Models::StraightFlush,
         Models::FourOfAKind,
         Models::FullHouse,
         Models::Flush,
         Models::Straight,
         Models::Three,
         Models::TwoPair,
         Models::Pair,
         Models::HighCard
        ].each do |point_class|
          begin
            throw :found, point_class.new(hand.cards)
          rescue Models::Point::NotValidPoint
          end
          nil
        end
      end

    end
  end

end