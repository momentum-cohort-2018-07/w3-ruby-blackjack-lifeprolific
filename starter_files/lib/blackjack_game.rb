require_relative 'deck'
require_relative 'player'
require_relative 'hand'
require_relative 'card'

class BlackjackGame

   def initialize
    puts "Blackjack, begin!"
    @player = Player.new(100)
    @deck = Deck.new
   end

   def new_round
    @deck = Deck.new
    @deck.shuffle
    @player.hand = Hand.new
    @player.hand.add_card(@deck.draw)
    @player.hand.add_card(@deck.draw)
    puts @player.hand
   end
end