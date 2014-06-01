module Models
  class Game
    def initialize players
      raise NotValidPlayers unless players
      @players = Array(players)
    end

    def play
      @players.each &:play
    end

    def scoreboard
      @scoreboard ||= @players.sort_by{|player| player.point}.reverse
    end

    def winner
      scoreboard.first
    end

    class NotValidPlayers < StandardError ; end

  end
end