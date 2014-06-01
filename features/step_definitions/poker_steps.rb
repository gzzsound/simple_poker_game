require 'poker_game'

Before do
  @players = []
end

Given(/^"([^"]*)" to "([^"]*)"$/) do |cards,name|
  @players << Models::Player.new(name, cards)
end

When(/^the game is over$/) do
  @game = Models::Game.new @players
  @game.play
end

Then(/^the winner is the "(.*?)"$/) do |name|
  expect(@game.winner.name == name).to be_true
end

Then(/^the scoreboard is "([^"]*)", "([^"]*)"$/) do |player1, player2|
  expect(@game.scoreboard.map{|player| player.name} == [player1, player2]).to be_true
end