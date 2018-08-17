#!/usr/bin/env ruby
require_relative '../lib/blackjack_game'
require_relative '../lib/player'

puts "Hello and welcome to the game of blackjack! Let's begin."
game = BlackjackGame.new
while game.player.bank > 0
  game.new_round
  game.play_hand
end
puts "You have run out of money. Thank you for playing blackjack!"