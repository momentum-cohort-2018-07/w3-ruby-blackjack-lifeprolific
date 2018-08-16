require_relative 'deck'
require_relative 'player'
require_relative 'hand'
require_relative 'card'

class BlackjackGame

   def initialize
    puts "Blackjack, begin!"
    player = Player.new(100)
   end

   def new_round
    deck = Deck.new.shuffle
    player.hand = []
    player.hand.add_card(deck.draw)
    player.hand.add_card(deck.draw)
   end
end