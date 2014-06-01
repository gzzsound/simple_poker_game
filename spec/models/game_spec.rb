require 'spec_helper'

describe Models::Game do
  let(:player_one){Models::Player.new('Loser', '2C 2C 2C 2C 2C')}
  let(:player_two){Models::Player.new('Winner', '3C 3C 3C 3C 3C')}
  let(:game){Models::Game.new(player_one)}

  it 'raise an exception if no valid players given' do
    expect{Models::Game.new(nil)}.to raise_error Models::Game::NotValidPlayers
  end

  it 'call play method on each players' do
    allow(player_one).to receive(:play)
    game.play
    expect(player_one).to have_received(:play)
  end

  context 'scoreboard and winner' do
    let(:game){Models::Game.new([player_one, player_two])}

    it 'build a scoreboard based on point per player' do
      game.play
      expect(game.scoreboard.map{|p| p.name} == %w(Winner Loser)).to be_true
    end

    it 'know the winner' do
      expect(game.winner.name == 'Winner').to be_true
    end

  end

end