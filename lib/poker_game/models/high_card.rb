module Models
  class HighCard < Models::Point

    MAGNITUDE = 1

    def <=>(point)
      super point
      catch :found do
        zipped = @cards.sort.reverse.zip(point.cards.sort.reverse)
        zipped.each do |cards|
          order = cards.first <=> cards.last
          throw :found, order if order != 0
        end
      end
    end

  end
end